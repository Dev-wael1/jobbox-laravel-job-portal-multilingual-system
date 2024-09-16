<?php

namespace Botble\Theme\Supports;

use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class Youtube
{
    public static function getYoutubeVideoEmbedURL(string|null $url): string
    {
        $url = rtrim((string)$url, '/');

        if (! $url) {
            return $url;
        }

        if (Str::contains($url, ['watch?v=', 'shorts/'])) {
            $url = str_replace(['watch?v=', 'shorts/'], 'embed/', $url);
        } else {
            $exploded = explode('/', $url);

            if (count($exploded) > 1) {
                $videoID = str_replace(['embed', 'watch?v=', 'shorts'], '', Arr::last($exploded));

                $url = 'https://www.youtube.com/embed/' . $videoID;
            }
        }

        return $url;
    }

    public static function getYoutubeWatchURL(string|null $url): string
    {
        $url = rtrim((string)$url, '/');

        if (! $url) {
            return $url;
        }

        if (Str::contains($url, 'embed/')) {
            $url = str_replace('embed/', 'watch?v=', $url);
        } else {
            $exploded = explode('/', $url);

            if (count($exploded) > 1) {
                $videoID = str_replace('embed', '', str_replace('watch?v=', '', Arr::last($exploded)));

                $url = 'https://www.youtube.com/watch?v=' . $videoID;
            }
        }

        return $url;
    }

    public static function getYoutubeVideoID(string|null $url): string|null
    {
        $url = rtrim((string)$url, '/');

        if (! $url) {
            return $url;
        }

        $regExp = '/^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(shorts\/)|(watch\?))\??v?=?([^#&?]*).*/';

        preg_match($regExp, $url, $matches);

        if ($matches && strlen($matches[8]) == 11) {
            return $matches[8];
        }

        return null;
    }

    public static function isYoutubeURL(string|null $url): bool
    {
        $url = rtrim((string)$url, '/');

        if (! $url) {
            return false;
        }

        $regExp = '/^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|shorts\/|v\/)?)([\w\-]+)(\S+)?$/';

        return preg_match($regExp, $url);
    }
}
