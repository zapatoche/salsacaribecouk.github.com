---

layout: home
group: site-nav
title: Learn to dance <span>Cuban Salsa </span>


---
{% include JB/setup %}

<section class="section featured">
  {% for post in site.posts  %}
    {% include partials/feature_news_helper.html %}
  {% endfor %}
</section>
<section class="section news-roll">
  {% for post in site.posts %}
    {% include partials/news_helper.html %}
  {% endfor %}
</section>
<section class="section news-roll">
  {% for post in site.posts limit:5  %}
    {% if post.category[0] == "news"  %}
      <h1>{{ post.title }}</h1>
    {% endif %}
  {% endfor %}
</section>
<section class="section about">
  <h2>about Salsa Caribe</h2>
  {% for post in site.posts  %}
    {% if post.layout == 'about' %}
      {{ post.description }}
    {% endif %}
  {% endfor %}
</section>
