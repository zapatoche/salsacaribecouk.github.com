---

layout: page
group: site-nav
id: &slug home
slug: *slug
title: Learn to dance with the Cuban Salsa specialists

acl:
  group: monday
  title: The Afro-Cuban Lounge
  slug: afro-cuban-lounge
  tagline: The longest running Cuban Salsa Club in London
  description: An Evening of Essential Afro-Cuban Flavas, Salsa Timba & Latin Jazz

  image: 
    url: 'http://farm7.staticflickr.com/6182/6114145392_f3b0f12d90_m.jpg'
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

iagt:
  group: saturday
  title: It's a Girl thing 
  slug: its-a-girl-thing 
  tagline: sassy salsa styling for girlz!!!
  description: The next ladies styling workshop will be on Sat 22nd October

  image: 
    url: 'http://farm7.staticflickr.com/6194/6113187339_9f002a1d83_m.jpg'
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
	<div class="section alert" markdown="1">
#Tickets to the Los Van Van gig in Brixton Thursday 1st March available from DJ Dr Jim at all our events - no booking fee 
  </div>
</section>
<section>
	<div markdown="1" class="section news">

#this week upcoming events:

Ladies, you know you were born to dance, so why not come and experience It's A Girl Thing!, the Cuban styling workshop taught from the female perspective that helps you hone your rhythm, technique & poise and gives you confidence and improvisation ideas. So whether you're into flashy footwork, expressive arms, wiggling meneo or afro-Cuban movement there's something for you this Saturday ( 11th Feb 2-4.30pm) at The Place

Remember that our regular salsa, rueda and rumba classes at The Place are on as usual this Sunday, as of course is Monday night at The Buffalo Bar, your weekly Cuban dance fest. It's Valentines, so hope you can come and share your love of all things timba, salsa and son. Don't forget, real men wear pink ;0)

  </div>
</section>
<section>
	<div class="section featured">
  
   <article>
      <div class="article vevent">
        <header>
          <div class="header">
            <hgroup class="summary">
              <h1><a href="{{ site.url }}/{{ page.acl.group }}/{{ page.acl.slug }}"><span>{{ page.acl.title }} </span></a></h1>
              <h3 class="strapline">{{ page.acl.tagline }}</h3>
            </hgroup>
          </div>
        </header>
        <h2 class="description">{{ page.acl.description }}</h2>
        <a href="{{ site.url }}/{{ page.acl.group }}/{{ page.acl.slug }}">
          <figure>
            <img src="{{ page.acl.image.url }}" alt="{{ page.acl.image.description }}" class="paysage">
            <figcaption>{{ page.acl.image.caption }}</figcaption>
          </figure>
        </a>

If you want to up the feelgood factor Cuban style, then this Monday night at The Buffalo Bar is for you. Doors open at 7.30pm, with classes for all levels from around 7.45pm, followed by an evening of dancing, drinking and socialising to the sounds of the very best Cuban salsa, timba &amp; son, courtesy of DJ Dr Jim.

        <a href="{{ site.url }}/{{ page.acl.group }}/{{ page.acl.slug }}">more info...</a>
      </div>
    </article>

   <article>
      <div class="article vevent">
        <header>
          <div class="header">
            <hgroup class="summary">
              <h1><a href="{{ site.url }}/{{ page.iagt.group }}/{{ page.iagt.slug }}"><span>{{ page.iagt.title }} </span></a></h1>
              <h3 class="strapline">{{ page.iagt.tagline }}</h3>
            </hgroup>
          </div>
        </header>
        <h2 class="description">{{ page.iagt.description }}</h2>
        <a href="{{ site.url }}/{{ page.iagt.group }}/{{ page.iagt.slug }}">
          <figure>
            <img src="{{ page.iagt.image.url }}" alt="{{ page.iagt.image.description }}" class="portrait">
            <figcaption>{{ page.iagt.image.caption }}</figcaption>
          </figure>
        </a>

Calling all chicas who like their Cuban salsa with extra sabor: It&#8217;s a Girl Thing! this Saturday at The Place Dance Studios. Ladies, it&#8217;s time to get your whole body moving, connecting footwork to hip, torso, arm &amp; shoulder movement, so you look and feel great over the party season.


        <a href="{{ site.url }}/{{ page.iagt.group }}/{{ page.iagt.slug }}">more info...</a>
      </div>
    </article>
  
  </div>
</section>
