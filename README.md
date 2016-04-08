
    <article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-pyechonest" class="anchor" href="#pyechonest" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Pyechonest</h1>

<p>Tap into <a href="http://the.echonest.com/">The Echo Nest's</a> Musical Brain for the best music search, information, recommendations and remix tools on the web.</p>

<p>Pyechonest is an open source Python library for the Echo Nest API.  With Pyechonest you have Python access to the entire set of API methods including:</p>

<ul>
<li><strong>artist</strong> - search for artists by name, description, or attribute, and get back detailed information about any artist including audio, similar artists, blogs, familiarity, hotttnesss, news, reviews, urls and video.</li>
<li><strong>song</strong> - search songs by artist, title, description, or attribute (tempo, duration, etc) and get detailed information back about each song, such as hotttnesss, audio_summary, or tracks.</li>
<li><strong>track</strong> - upload a track to the Echo Nest and receive summary information about the track including key, duration, mode, tempo, time signature along with detailed track info including timbre, pitch, rhythm and loudness information.</li>
</ul>

<h2><a id="user-content-install" class="anchor" href="#install" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Install</h2>

<p>There are a few different ways you can install pyechonest:</p>

<ul>
<li>Use setuptools: <code>easy_install -U pyechonest</code></li>
<li>Download the zipfile from the <a href="https://github.com/echonest/pyechonest/releases">releases</a> page and install it. </li>
<li>Checkout the source: <code>git clone git://github.com/echonest/pyechonest.git</code> and install it yourself.</li>
</ul>

<h2><a id="user-content-getting-started" class="anchor" href="#getting-started" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Getting Started</h2>

<ul>
<li>Install Pyechonest</li>
<li><strong>Get an API key</strong> - to use the Echo Nest API you need an Echo Nest API key.  You can get one for free at <a href="http://developer.echonest.com">developer.echonest.com</a>.</li>
<li><strong>Set the API</strong> key - you can do this one of two ways:</li>
<li>set an environment variable named <code>ECHO_NEST_API_KEY</code> to your API key</li>
<li>Include this snippet of code at the beginning of your python scripts:</li>
</ul>

<div class="highlight highlight-source-python"><pre>    <span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> config
    config.<span class="pl-c1">ECHO_NEST_API_KEY</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">"</span>YOUR API KEY<span class="pl-pds">"</span></span></pre></div>

<ul>
<li>Check out the <a href="http://echonest.github.com/pyechonest/">docs</a> and examples below.</li>
</ul>

<h2><a id="user-content-examples" class="anchor" href="#examples" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" role="img" version="1.1" viewBox="0 0 16 16" width="16"><path d="M4 9h1v1h-1c-1.5 0-3-1.69-3-3.5s1.55-3.5 3-3.5h4c1.45 0 3 1.69 3 3.5 0 1.41-0.91 2.72-2 3.25v-1.16c0.58-0.45 1-1.27 1-2.09 0-1.28-1.02-2.5-2-2.5H4c-0.98 0-2 1.22-2 2.5s1 2.5 2 2.5z m9-3h-1v1h1c1 0 2 1.22 2 2.5s-1.02 2.5-2 2.5H9c-0.98 0-2-1.22-2-2.5 0-0.83 0.42-1.64 1-2.09v-1.16c-1.09 0.53-2 1.84-2 3.25 0 1.81 1.55 3.5 3 3.5h4c1.45 0 3-1.69 3-3.5s-1.5-3.5-3-3.5z"></path></svg></a>Examples</h2>

<p><em>All examples assume you have already setup your api key!</em></p>

<p>Find artists that are similar to 'Bikini Kill':</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> artist
bk <span class="pl-k">=</span> artist.Artist(<span class="pl-s"><span class="pl-pds">'</span>bikini kill<span class="pl-pds">'</span></span>)
<span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">"</span>Artists similar to: <span class="pl-c1">%s</span>:<span class="pl-pds">"</span></span> <span class="pl-k">%</span> (bk.name,)
<span class="pl-k">for</span> similar_artist <span class="pl-k">in</span> bk.similar: <span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">"</span><span class="pl-cce">\t</span><span class="pl-c1">%s</span><span class="pl-pds">"</span></span> <span class="pl-k">%</span> (similar_artist.name,)</pre></div>

<p>Search for artist:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> artist
weezer_results <span class="pl-k">=</span> artist.search(<span class="pl-v">name</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>weezer<span class="pl-pds">'</span></span>)
weezer <span class="pl-k">=</span> weezer_results[<span class="pl-c1">0</span>]
weezer_blogs <span class="pl-k">=</span> weezer.blogs
<span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">'</span>Blogs about weezer:<span class="pl-pds">'</span></span>, [blog.get(<span class="pl-s"><span class="pl-pds">'</span>url<span class="pl-pds">'</span></span>) <span class="pl-k">for</span> blog <span class="pl-k">in</span> weezer_blogs]</pre></div>

<p>Get an artist by name:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> artist
a <span class="pl-k">=</span> artist.Artist(<span class="pl-s"><span class="pl-pds">'</span>lady gaga<span class="pl-pds">'</span></span>)
<span class="pl-c1">print</span> a.id</pre></div>

<p>Get an artist by Musicbrainz ID:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> artist
a <span class="pl-k">=</span> artist.Artist(<span class="pl-s"><span class="pl-pds">'</span>musicbrainz:artist:a74b1b7f-71a5-4011-9441-d0b5e4122711<span class="pl-pds">'</span></span>)
<span class="pl-c1">print</span> a.name</pre></div>

<p>Get the top hottt artists:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> artist
<span class="pl-k">for</span> hottt_artist <span class="pl-k">in</span> artist.top_hottt():
<span class="pl-c1">print</span> hottt_artist.name, hottt_artist.hotttnesss</pre></div>

<p>Search for songs:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> song
rkp_results <span class="pl-k">=</span> song.search(<span class="pl-v">artist</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>radiohead<span class="pl-pds">'</span></span>, <span class="pl-v">title</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>karma police<span class="pl-pds">'</span></span>)
karma_police <span class="pl-k">=</span> rkp_results[<span class="pl-c1">0</span>]
<span class="pl-c1">print</span> karma_police.artist_location
<span class="pl-c1">print</span> <span class="pl-s"><span class="pl-pds">'</span>tempo:<span class="pl-pds">'</span></span>,karma_police.audio_summary[<span class="pl-s"><span class="pl-pds">'</span>tempo<span class="pl-pds">'</span></span>],<span class="pl-s"><span class="pl-pds">'</span>duration:<span class="pl-pds">'</span></span>,karma_police.audio_summary[<span class="pl-s"><span class="pl-pds">'</span>duration<span class="pl-pds">'</span></span>]</pre></div>

<p>Get a song's audio_url and analysis_url:</p>

<div class="highlight highlight-source-python"><pre><span class="pl-k">from</span> pyechonest <span class="pl-k">import</span> song
ss_results <span class="pl-k">=</span> song.search(<span class="pl-v">artist</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>the national<span class="pl-pds">'</span></span>, <span class="pl-v">title</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">'</span>slow show<span class="pl-pds">'</span></span>, <span class="pl-v">buckets</span><span class="pl-k">=</span>[<span class="pl-s"><span class="pl-pds">'</span>id:7digital-US<span class="pl-pds">'</span></span>, <span class="pl-s"><span class="pl-pds">'</span>tracks<span class="pl-pds">'</span></span>], <span class="pl-v">limit</span><span class="pl-k">=</span><span class="pl-c1">True</span>)
slow_show <span class="pl-k">=</span> ss_results[<span class="pl-c1">0</span>]
ss_tracks <span class="pl-k">=</span> slow_show.get_tracks(<span class="pl-s"><span class="pl-pds">'</span>7digital-US<span class="pl-pds">'</span></span>)
<span class="pl-c1">print</span> ss_tracks[<span class="pl-c1">0</span>].get(<span class="pl-s"><span class="pl-pds">'</span>preview_url<span class="pl-pds">'</span></span>)</pre></div>

<p>-<a href="https://camo.githubusercontent.com/c7a3810cd59b15375246e5468b46cdecd18edbb9/687474703a2f2f692e696d6775722e636f6d2f57574c596f2e676966" target="_blank"><img src="https://camo.githubusercontent.com/c7a3810cd59b15375246e5468b46cdecd18edbb9/687474703a2f2f692e696d6775722e636f6d2f57574c596f2e676966" alt="alt text" title="Frustrated cat can't believe this is the 12th time he's clicked on an auto-linked README.md URL" data-canonical-src="http://i.imgur.com/WWLYo.gif" style="max-width:100%;"></a></p>
</article>
  