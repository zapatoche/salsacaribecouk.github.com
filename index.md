---

layout: page
group: site-nav
id: &slug home
slug: *slug
title: Learn to dance with the Cuban Salsa specialists


---
{% include JB/setup %}

<section>
  <div class="section news">
    <h2>latest news</h2> 
   {% for post in site.posts limit: 1 %}
    {% if post.rel != "me" %}
    <h2><a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
    <h1>{{ post.description }}</h1>
    <div class="intro">
      {{ post.introduction | markdownify }}
    </div>
    <footer>
      <div class="footer">
      
      </div>
    </footer>
    {% endif %}
  {% endfor %} 
  </div>
</section>

<section>
  <div class="section featured">
  <h2>Our events</h2>
    {% for post in site.posts reversed  %}
      {% if post.rel == "me" %}
  <article>
    <div class="article">
      <header>
        <div class="header">
          <hgroup>
            <h3 class="pill"><span>{{ post.category }}</span></h3>
            <h2><a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></h2>
          </hgroup>
        </div>
      </header>
      <footer>
        <div class="footer">
          <p>{{ post.start_date }} {% if post.end_date %}- {{ post.end_date }}{% endif %} <a href="{{ post.location.map_url }}" title="Locate {{ post.location.name}} on Google map"><b>{{post.location.name}}</b></a>, {{ post.location.street_address}}, {{ post.location.postal_code}}, {{ post.location.locality }}.</p>
        </div>
      </footer>
      <h1>{{ post.description }}</h1>
      <div class="intro">
        {{ post.introduction | markdownify }}
      </div>
    </div>
  </article>
      {% endif %}
    {% endfor %}   
  </div>
</section>
