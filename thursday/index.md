---

layout: page
group: &slug thursday
slug: *slug
category: [class, club]

acs:
  title: Abajo @ La Sera
  slug: abajo-sera
  tagline: tag line Abajo Sera
  description: description Abajo Sera

  image: 
    url: 'http://farm8.staticflickr.com/7143/6829435731_48ffc0bf84_z.jpg'
    description: &alt Cuban Salsa Every Thursday @ La Sera
    caption: Start the 8th of March 2012

  location:
    name: La Sera
    url: http://replace.me
    map_url: 'http://g.co/maps/szkqv'
    map_image: 'http://maps.googleapis.com/maps/api/staticmap?center=16,flaxman,terrace,wc1,London&amp;zoom=15&amp;size=198x198&amp;markers=color:red%7Clabel:a%7C51.527717,-0.128275&amp;sensor=false'
    street_address: 176 Stoke Newington High Street
    postal_code: N16 75L
    locality: London
    country: United Kingdom

---
{% include JB/setup %}

<section>
  <div class="section calendar-item">
    <h2 id="{{page.slug}}"><span class="flag">{{ page.slug | capitalize }}</span></h2>
    <article>
      <div class="article vevent">
        <header>
          <div class="header">
            <hgroup class="summary">
              <h1><a href="{{ site.url }}/{{ page.slug }}/{{ page.acs.slug }}"><span>{{ page.acs.title }} </span></a></h1>
              <h3 class="strapline">{{ page.acs.tagline }}</h3>
            </hgroup>
          </div>
        </header>
        <h2 class="description">{{ page.acs.description }}</h2>
        <a href="{{ site.url }}/{{ page.slug }}/{{ page.acs.slug }}">
          <figure>
            <img src="{{ page.acs.image.url }}" alt="{{ page.acs.image.description }}" class="paysage">
            <figcaption>{{ page.acs.image.caption }}</figcaption>
          </figure>
        </a>

Salsa Classes to suit everyone from complete beginner to advanced salsero, plus an hour devoted to diverse Cuban rhythms and movement.

        <a href="{{ site.url }}/{{ page.slug }}/{{ page.acs.slug }}">more info...</a>
      </div>
    </article>
  </div>
</section>


