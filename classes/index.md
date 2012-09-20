---
layout: page
title: " Our classes and workshops"
description: ""
---
{% include JB/setup %}

<section>
  <div class="section featured">
  <h2>Our events</h2>
    {% for post in site.posts reversed  %}
      {% if post.category == "classes" %}
        {% include partials/events_helper.html %}
      {% endif %}
    {% endfor %}
  </div>
</section>

