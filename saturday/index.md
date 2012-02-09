---

layout: page
group: cal
id: &slug saturday
slug: *slug
category: [workshop]

iagt:
  group: saturday
  title: It's a Girl thing 
  slug: its-a-girl-thing 
  tagline: sassy salsa styling for girlz!!!
  description: The next ladies styling workshop will be on Sat 22nd October

  image: 
    url: 'http://farm7.staticflickr.com/6194/6113187339_9f002a1d83_z.jpg'
    description: &alt Susan doing some sassy styling !replaceme
    caption: *alt

  location:
    name: The Place
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
              <h1><a href="{{ site.url }}/{{ page.slug }}/{{ page.iagt.slug }}"><span>{{ page.iagt.title }}</span></a></h1>
              <h3 class="strapline">{{ page.iagt.tagline }}</h3>
            </hgroup>
          </div>
        </header>
        <h2 class="description">{{ page.iagt.description }}</h2>
        <a href="{{ site.url }}/{{ page.slug }}/{{ page.iagt.slug }}">
          <figure>
            <img src="{{ page.iagt.image.url }}" alt="{{ page.iagt.image.description }}">
            <figcaption>{{ page.iagt.image.caption }}</figcaption>
          </figure>
        </a>

Calling all chicas who like their Cuban salsa with extra sabor: It&#8217;s a Girl Thing! this Saturday at The Place Dance Studios. Ladies, it&#8217;s time to get your whole body moving, connecting footwork to hip, torso, arm &amp; shoulder movement, so you look and feel great over the party season.

        <a href="{{ site.url }}/{{ page.slug }}/{{ page.iagt.slug }}">more info...</a>
      </div>
    </article>
  </div>
</section>

