---

layout: home
group: site-nav
title: Learn to dance <span>Cuban Salsa </span>

---
{% include JB/setup %}
  
{% assign isfeature = site.tags.feature.size  %}
{% if isfeature >= 0  %}
  <section class="section featured">
    {% for post in site.tags.feature  limit:1 %}
      {% include partials/feature_news_helper.html %}
    {% endfor %}
  </section>
{% endif %}

{% assign isnewsroll =  site.tags.news.size  %}
{% if isnewsroll >= 0 %}
<section class="section news-roll">
  {% for post in site.tags.news limit:3  %}
    {% include partials/news_helper.html %}
  {% endfor %}
</section>
{% endif %}

<section class="section about">
  <h2>about Salsa Caribe</h2>
  {% for post in site.posts  %}
    {% if post.layout == 'about' %}
      {{ post.descriptioa | markdownify }}
    {% endif %}
  {% endfor %}
</section>
