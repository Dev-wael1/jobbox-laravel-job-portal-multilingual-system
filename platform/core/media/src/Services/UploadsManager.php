<?php

namespace Botble\Media\Services;

use Botble\Media\Facades\RvMedia;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use League\Flysystem\FilesystemException;
use League\Flysystem\UnableToRetrieveMetadata;

class UploadsManager
{
    public function fileDetails(string $path): array
    {
        return [
            'filename' => File::basename($path),
            'url' => $path,
            'mime_type' => $this->fileMimeType(RvMedia::getRealPath($path)),
            'size' => $this->fileSize($path),
            'modified' => $this->fileModified($path),
        ];
    }

    public function fileMimeType(string $path): string|null
    {
        return RvMedia::getMimeType($path);
    }

    public function fileSize(string $path): int
    {
        try {
            return Storage::size($path);
        } catch (UnableToRetrieveMetadata) {
            return 0;
        }
    }

    public function fileModified(string $path): string
    {
        try {
            return Carbon::createFromTimestamp(Storage::lastModified($path));
        } catch (UnableToRetrieveMetadata) {
            return Carbon::now();
        }
    }

    public function createDirectory(string $folder): bool|string
    {
        $folder = $this->cleanFolder($folder);

        if (Storage::exists($folder)) {
            return trans('core/media::media.folder_exists', compact('folder'));
        }

        return Storage::makeDirectory($folder);
    }

    protected function cleanFolder(string $folder): string
    {
        return DIRECTORY_SEPARATOR . trim(str_replace('..', '', $folder), DIRECTORY_SEPARATOR);
    }

    public function deleteDirectory(string $folder): bool|string
    {
        $folder = $this->cleanFolder($folder);

        $filesFolders = array_merge(Storage::directories($folder), Storage::files($folder));

        if (! empty($filesFolders)) {
            return trans('core/media::media.directory_must_empty');
        }

        return Storage::deleteDirectory($folder);
    }

    public function deleteFile(string $path): bool
    {
        $path = $this->cleanFolder($path);

        return Storage::delete($path);
    }

    public function saveFile(
        string $path,
        string $content,
        UploadedFile $file = null,
        array $visibility = ['visibility' => 'public']
    ): bool {
        if (! RvMedia::isChunkUploadEnabled() || ! $file) {
            return Storage::put($this->cleanFolder($path), $content, $visibility);
        }

        $currentChunksPath = RvMedia::getConfig('chunk.storage.chunks') . '/' . $file->getFilename();
        $disk = Storage::disk(RvMedia::getConfig('chunk.storage.disk'));

        try {
            $stream = $disk->getDriver()->readStream($currentChunksPath);

            if ($result = Storage::writeStream($path, $stream, $visibility)) {
                $disk->delete($currentChunksPath);
            }
        } catch (Exception|FilesystemException) {
            return Storage::put($this->cleanFolder($path), $content, $visibility);
        }

        return $result;
    }
}
