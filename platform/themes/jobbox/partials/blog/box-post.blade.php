<div class="col-lg-6 mb-30">
    <div class="card-grid-3 hover-up">
        <div class="text-center card-grid-3-image ">
            <a href="{{ $post->url }}">
                <figure>
                    <img src="{{ RvMedia::getImageUrl($post->image, null, false, RvMedia::getDefaultImage()) }}" alt="{{ $post->name }}" >
                </figure>
            </a>
        </div>
        <div class="card-block-info" >
            <div class="tags mb-15">
                @foreach($post->categories as $category )
                    <a class="btn btn-tag" href="{{ $category->url }}">{{ $category->name }}</a>&nbsp;
                @endforeach
            </div>
            <h5>
                <a href="{{ $post->url }}">{{ $post->name }}</a>
            </h5>
            <p class="mt-10 color-text-paragraph font-sm">{{ $post->description }}</p>
            <div class="card-2-bottom mt-20">
                <div class="row">
                    <div class="col-lg-6 col-6">
                        @if(!empty($post->author))
                            <div class="d-flex">
                                <img class="img-rounded" src="{{ $post->author->avatar_url }}">
                                <div class="info-right-img">
                                    <span class="font-sm font-bold color-brand-1 op-70">{{ $post->author->name }}</span>
                                    <br>
                                    <span class="font-xs color-text-paragraph-2">{{ $post->created_at->translatedFormat('M d, Y') }}</span>
                                </div>
                            </div>
                        @endif
                    </div>
                    <div class="col-lg-6 text-md-end col-6 pt-15">
                        <span class="color-text-paragraph-2 font-xs">
                            {{ __(':time mins to read', ['time' => MetaBox::getMetaData($post, 'time_to_read', true) ?:  number_format(strlen(strip_tags($post->content)) / 300)]) }}
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
