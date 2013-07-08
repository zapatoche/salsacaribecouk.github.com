---

layout: home
group: site-nav
title: <span>Learn to dance</span> <span>Cuban Salsa </span>

---
{% include JB/setup %}
<section class="section event-list">
<figure class="figure-hero">
{% for post in site.posts reversed  %}
{%  capture day %}{{post.date |date: '%A' | downcase }}{% endcapture %}
{% if post.tags contains 'classes' or post.tags contains 'workshop' or post.tags contains 'club-nights' %}
{% if post.image %}
<div class="event-header">
  <div  data-alt="{{ post.image.alt }}" data-picture class="hero">
    <div data-src="{{ post.image.small }}"></div>
    <div data-src="{{ post.image.medium }}" data-media="(min-width: 400px)"></div>
    <div data-src="{{ post.image.medium@2x }}" data-media="(min-width: 400px) and (min-device-pixel-ratio: 2.0)"></div>
    <!--[if (lt IE 9) & (!IEMobile)]>
      <div data-src="{{ post.image.medium }}"></div>
      <![endif]>-->
    <noscript>
      <img src="{{ post.image.small }}" alt="{{ post.image.alt }}"  />
    </noscript>
  </div>
  <a href="{{ post.url }}"  class="overlay">{{ day }}</a>
</div>
{% endif %}
{% endif %}
{% endfor %}

  <figaption class="figcaption">
    <h2 class="summary">Explore the true essence of Cuban music and dance <span>with {{ site.vcard.name }}</span></h2>
  </figaption>
</figure>

</section>

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
  {% for post in site.tags.news limit:1  %}
    {% include partials/news_helper.html %}
  {% endfor %}
</section>
{% endif %}

<section class="section about">
  <h2 class="section-title">about Salsa Caribe</h2>
  {% for post in site.posts  %}
    {% if post.layout == 'about' %}
      {{ post.description | markdownify }}
    {% endif %}
  {% endfor %}
</section>
