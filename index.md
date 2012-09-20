---

layout: home
group: site-nav
title: Learn to dance with the Cuban Salsa specialists


---
{% include JB/setup %}

<!-- <section> -->
<!--   <div class="section news"> -->
<!--     <h2>latest news</h2> -->
<!--    {% for post in site.posts limit: 1 %} -->
<!--     {% if post.category == "news" %} -->
<!--     <h2><a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2> -->
<!--     <h1>{{ post.description }}</h1> -->
<!--     <div class="intro"> -->
<!--       {{ post.introduction | markdownify }} -->
<!--     </div> -->
<!--     <footer> -->
<!--       <div class="footer"> -->

<!--       </div> -->
<!--     </footer> -->
<!--     {% endif %} -->
<!--   {% endfor %} -->
<!--   </div> -->
<!-- </section> -->

<section class="section featured">
  <h2>latest news and events</h2>
    {% for post in site.posts reversed  %}
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

<section class="section classes">
  <h2>Our club nights</h2>
    {% for post in site.posts reversed  %}
      {% if post.category == "club" %}
        {% include partials/events_helper.html %}
      {% endif %}
    {% endfor %}
</section>
