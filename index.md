---

layout: home
group: site-nav
title: Learn to dance <span>Cuban Salsa </span>


---
{% include JB/setup %}

<section class="section featured">
  <h2>latest news and events</h2>
  {% for post in site.posts  reversed  %}
    {% if post.category[0] == "news" %}
      {% include partials/news_helper.html %}
    {% endif %}
  {% endfor %}
</section>

<section class="section about">

<h2>about Salsa Caribe</h2>

{% for post in site.posts %}
  {% if post.layout == 'about' %}
    {{ post.description }}
  {% endif %}
{% endfor %}
</section>
