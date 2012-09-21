---

layout: home
group: site-nav
title: Learn to dance <span>Cuban Salsa </span>


---
{% include JB/setup %}

<section class="section featured">
  <h2>latest news and events</h2>
    {% for post in site.posts  reversed  %}
      {% if post.category == "news" %}
        <p>{{ post.title }}</p>
        <p>{{ post.description | markdownify }}</p>
      {% endif %}
    {% endfor %}
</section>

<section class="section classes">
  <h2>Our classes</h2>
    {% for post in site.posts reversed  %}
      {% if post.category == "classes" %}
        {% include partials/events_helper.html %}
      {% endif %}
    {% endfor %}
</section>

<section class="section club-nights">
  <h2>Our club nights</h2>
    {% for post in site.posts reversed  %}
      {% if post.category == "club-nights" %}
        {% include partials/events_helper.html %}
      {% endif %}
    {% endfor %}
</section>
