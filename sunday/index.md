---

layout: page
group: cal
id: &slug sunday
slug: *slug
category: [class, workshop]

acs:
  title: The Afro-Cuban studio
  slug: afro-cuban-studio
  tagline: Dive into Afro-Cuban rythm
  description: Learn Casino Salsa & The Roots of Cuban Salsa

  image: 
    url: 'http://placehold.it/550x300'
    description: &alt Salsa Caribe's at the afro-cuban studio
    caption: *alt

  location:
    name: The Place Dance Studio
    url: http://www.theplace.org.uk/
    map_url: 'http://g.co/maps/szkqv'
    map_image: 'http://maps.googleapis.com/maps/api/staticmap?center=16,flaxman,terrace,wc1,London&amp;zoom=15&amp;size=198x198&amp;markers=color:red%7Clabel:a%7C51.527717,-0.128275&amp;sensor=false'
    street_address: 16 Flaxman Terrace
    postal_code: WC1
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

