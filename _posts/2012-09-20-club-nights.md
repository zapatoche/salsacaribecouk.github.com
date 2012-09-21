---
layout: page
title: "club nights & events"
description: ""
---
{% include JB/setup %}



<section class="section clubs">
  <h2>Our club nights</h2>
    {% for post in site.posts reversed  %}
      {% if post.category == "club-nights" %}
        {% include partials/events_helper.html %}
      {% endif %}
    {% endfor %}
</section>

