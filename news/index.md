---
layout: default
title: Latest News
id: news
---
 
<section class="content">
  <h2>{{ page.title }}</h2>
 
</section>
 
<article>
  <div class="article">
    {% for post in site.posts  %}
      {% if post.rel != "me" %}
        <dt>{{ post.category }}</dt>
        <dd> <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></dd>
      {% endif %}
    {% endfor %} 
  </div>
</article>
