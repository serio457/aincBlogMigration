---
title: Rebuilding Awesome Inc Website With Jekyll
date: 2014-01-11 00:00:00 Z
layout: post
---
 
<h3><figure class="tmblr-full" data-orig-height="237" data-orig-width="500" data-orig-src="https://66.media.tumblr.com/dba9c4af4376e5101179cfaa3fc67499/tumblr_inline_mz90588Pl41spm8pc.png"><img alt="image" src="https://66.media.tumblr.com/4146e9745a656403e5e710679676b7b7/tumblr_inline_pk0lp0RZgm1spm8pc_540.png" data-orig-height="237" data-orig-width="500" data-orig-src="https://66.media.tumblr.com/dba9c4af4376e5101179cfaa3fc67499/tumblr_inline_mz90588Pl41spm8pc.png"/></figure></h3>

<p>Jekyll is a popular Static Site Generator. And it is magical.</p>

<p>I cut my programming teeth on hand-coded PHP websites. The time saving benefits of `echo $header;` showed me the power of using programming even for basic web templating purposes. A few dozen Wordpress sites later, I began to get frustrated with the maintenance overhead and meandering speeds, especially when WP is hosted on inexpensive vanilla web servers. While there are many solutions to these problems, I began to notice a few things about our sites, and the engineer in me began to think that Wordpress was not ideal. First, I realized that while we make frequent content changes to our site, from the user’s perspective, it is a static site. When one user visits our site, he or she will have the same experience as another user who follows a few minutes later. If our site only changes when we push changes to the site, why does Wordpress regenerate each document whenever it’s visited? While proper caching could solve this problem, we were still burdened by the pain of maintaining a Wordpress installation over time. Our Web Team at Awesome Inc is meant as a training program for aspiring developers. Working with students on semester-long internships, we have lots of team member transitions. This makes it tough when we built a Wordpress site 9 months ago, and nobody from that original team is around when we need to update Wordpress and its (often flaky) set of themes and plugins. Once again, this is not a knock on Wordpress (it’s an amazing tool) nor our Team Alpha members (this may be their first site ever, and we encourage them to <a href="http://25.media.tumblr.com/tumblr_lc63ingGof1qz6pqio1_500.png" target="_blank">move fast and break things</a>). This comes down to applying the right tool to the right job, and WP was no longer it for our needs. So that’s when we turned to <a href="http://jekyllrb.com/" target="_blank">Jekyll</a>, a static site generator from <a href="https://github.com/jekyll/jekyll/graphs/contributors" target="_blank">the folks</a> who started Github.</p>

<p>So, with no further ado, here are the top 5 reasons we love Jekyll:</p>

<p><strong>1. Hosting via Github Pages</strong></p>
<p>The great part about serving our static site from Github Pages is how fast and reliable the service is. Oh, did I mention that it’s free? An added bonus in using Github for a coding school like ours is the ability to showcase our code as part of our courses. And on more than one occasion it has been critical to be able to make an urgent change from my mobile phone, say while our team is out at <a href="http://www.keeneland.com/racing/app" target="_blank">Keeneland</a> or at a Kentucky basketball game. With Github, I can make changes to any text file in the repository right from my web browser.</p>

<p><strong>2. Git workflow</strong></p>
<p>Source control was one of the top things on my list for our Web Team members to learn, as the ability to efficiently and effectively collaborate with a team is important for developers in both startups and large companies. When something changes on our website, I want everyone to know who made the change, when they made it, and why. Oh, and it’s pretty nice to be able to revert if we break something! It’s also handy to be able to deploy with a simple `git push origin master` (or a click of “Commit &amp; Sync” on the <a href="http://mac.github.com/" target="_blank">Github Mac App</a>) instead of using a clunky FTP client.</p>

<p><strong>3. Templates</strong></p>
<p>The lack of templating features was the first thing to annoy me about simple HTML-only static sites. When we needed to add Google Analytics, make a change to a footer link, or reign in an errant CSS selector, we had to repeat these same changes across ALL of our pages. With 1 or 2 pages, this was fine. With a growing assortment of landing pages and Awesome Inc U course schedules, this became tedious. Fortunately, Jekyll and its implementation of the <a href="http://docs.shopify.com/themes/liquid-basics" target="_blank">Liquid templating language</a> came to the rescue! We moved all of our header and footer content to a file in the `_layouts` directory. We have a massive table that lists all our programming courses, and this table needs to show up on 3 different pages, so that now lives in the `_includes` folder. And there are some fun projects that our Web Team will be tackling soon to keep our content as fresh as possible, thanks to the time-saving features of templates.</p>

<p><strong>4. Pretty URLs</strong></p>
<p>I’m a stickler for pretty URLs. Then again, <a href="http://www.w3.org/Provider/Style/URI" target="_blank">so is Tim BL</a>. When we <a href="https://github.com/ainc/AwesomeIncU/tree/de46ac17a0e087c95326bba35d4bc03d54202d32" target="_blank">first launched AwesomeIncU.com</a>, everything ended in a `.html`. While this is not necessarily a faux pas (even simplicity-obsessed Apple shows <a href="http://www.apple.com/macbook-air/specs.html" target="_blank">some .html pages</a> on their site), I like to conceal implementation details as much as possible. If there’s one thing I know about the world, it’s that technology will change in the future. Then it will change again. There are plenty of options to rewrite pretty URLs, but the one of the simplest ways is to nest your actual pages inside a directory, and name them the Apache default of `index.html`. While this works great on the deployment side, it’s ugly to work with from a development side when all your files are called “index.html”. Sadface. Fortunately, the simple line `permalink: pretty` in your `_config.yml` file will take care of this for your whole Jekyll site.</p>

<p><strong>5. Plugins</strong></p>
<p>This is actually our most debated “love” for Jekyll. The ability to extend Jekyll’s native set of functions is great, and there’s already a decent swath of plugins available for what you’re most likely to need. We’re huge fans of <a href="https://github.com/tsmango/jekyll_alias_generator" target="_blank">aliasgenerator</a> and <a href="https://github.com/kinnetica/jekyll-plugins" target="_blank">sitemapgenerator</a>. The downside is in making those plugins work nicely with Github Pages. By default, Pages runs in `&ndash;safe` mode, meaning that your plugins (which are .rb Ruby scripts) don’t get processed by Github’s servers. It’s still possible to work around this. In fact, we’ve found at least 2 ways to do this. The first option is to host your code on Github, but use a post-receive hook to host your _site directory on a web server. You get all the collaborative benefits of Github, and you still get a decent speed increase by serving static pages instead of a dynamic Wordpress site with its PHP scripts and database access. The second method is a bit more complex, but quite elegant in that it allows you to still serve your entire website (source and _site contents) on Github. Huge thanks to the team at Nitrous.io for sharing their <a href="http://blog.nitrous.io/2013/08/30/using-jekyll-plugins-on-github-pages.html" target="_blank">Rakefile setup</a>.</p>

<p>So, those are a few of the reasons we love Jekyll for building websites. The team at Development Seed has some great insights on <a href="http://developmentseed.org/blog/2012/07/27/build-cms-free-websites/" target="_blank">why they made the switch to Jekyll</a>, which helped influence us to join the club. If you’d like to know more about how to setup your website with this method, check out our new Udemy Course: <a href="https://www.udemy.com/jekyll-and-github-pages/?couponCode=aincblog" title="Discount on Udemy course" target="_blank">Create Your Website With Jekyll And Github Pages</a></p>

<p><em>By Nick Such</em></p>
<p><em>Co-founder, <a href="http://www.awesomeinc.org" target="_blank">Awesome Inc</a></em></p>