---

layout: page
group: &slug monday
slug: *slug
category: [class, club]

acl:
  title: The Afro-Cuban Lounge
  slug: afro-cuban-lounge
  tagline: The longest running Cuban Salsa Club in London
  description: An Evening of Essential Afro-Cuban Flavas, Salsa Timba & Latin Jazz

  image: 
    url: 'http://farm7.staticflickr.com/6182/6114145392_f3b0f12d90_z.jpg'
    description: &alt Salsa Caribe's 10 years anniversary party
    caption: *alt

  location:
    name: The Buffalo Bar
    url: http://www.buffalobar.co.uk
    map_url: 'http://g.co/maps/nw94u'
    map_image: 'http://maps.googleapis.com/maps/api/staticmap?center=51.54580,-0.103616&amp;zoom=15&amp;size=198x198&amp;markers=color:red%7Clabel:a%7C51.54580,-0.103616&amp;sensor=false'
    street_address: 259 Upper street
    postal_code: N1 1RU
    locality: Islington
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
              <h1><a href="{{ site.url }}/{{ page.slug }}/{{ page.acl.slug }}"><span>{{ page.acl.title }} </span></a></h1>
              <h3 class="strapline">{{ page.acl.tagline }}</h3>
            </hgroup>
          </div>
        </header>
        <h2 class="description">{{ page.acl.description }}</h2>
        <a href="{{ site.url }}/{{ page.slug }}/{{ page.acl.slug }}">
          <figure>
            <img src="{{ page.acl.image.url }}" alt="{{ page.acl.image.description }}" class="paysage">
            <figcaption>{{ page.acl.image.caption }}</figcaption>
          </figure>
        </a>

If you want to up the feelgood factor Cuban style, then this Monday night at The Buffalo Bar is for you. Doors open at 7.30pm, with classes for all levels from around 7.45pm, followed by an evening of dancing, drinking and socialising to the sounds of the very best Cuban salsa, timba &amp; son, courtesy of DJ Dr Jim.

        <a href="{{ site.url }}/{{ page.slug }}/{{ page.acl.slug }}">more info...</a>
      </div>
    </article>
  </div>
</section>
