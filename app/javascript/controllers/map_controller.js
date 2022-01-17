import { Controller } from '@hotwired/stimulus'

import mapboxgl from 'mapbox-gl'
export default class extends Controller {
  static values = {
    token: String,
    latitude: Number,
    longitude: Number,
    users: Array,
    employees: Array,
  }

  connect(e) {
    mapboxgl.accessToken = this.tokenValue //
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [this.longitudeValue, this.latitudeValue],
      zoom: 8,
    })
    const map = this.map
    this.marker = new mapboxgl.Marker()
      .setLngLat([this.longitudeValue, this.latitudeValue])
      .addTo(this.map)
    if (this.usersValue !== undefined) {
      this.usersValue.forEach((element) => {
        new mapboxgl.Marker()
          .setLngLat([element[0], element[1]])
          .addTo(this.map)
      })
    }

    if (this.employeesValue !== undefined) {
      this.employeesValue.forEach((element) => {
        new mapboxgl.Marker()
          .setLngLat([element[0], element[1]])
          .addTo(this.map)
      })
    }

    const start = [this.longitudeValue, this.latitudeValue]
    const coords = this.usersValue[0]

    // create a function to make a directions request
    async function getRoute(end) {
      // make a directions request using cycling profile
      // an arbitrary start will always be the same
      // only the end or destination will change
      const query = await fetch(
        `https://api.mapbox.com/directions/v5/mapbox/cycling/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
        { method: 'GET' },
      )
      const json = await query.json()
      const data = json.routes[0]
      const route = data.geometry.coordinates
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route,
        },
      }
      // if the route already exists on the map, we'll reset it using setData
      if (map.getSource('route')) {
        map.getSource('route').setData(geojson)
      }
      // otherwise, we'll make a new request
      else {
        map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson,
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round',
          },
          paint: {
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75,
          },
        })
      }
      // add turn instructions here at the end
    }

    map.on('load', () => {
      // make an initial directions request that
      // starts and ends at the same location
      getRoute(start)

      // Add starting point to the map
      map.addLayer({
        id: 'point',
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                properties: {},
                geometry: {
                  type: 'Point',
                  coordinates: start,
                },
              },
            ],
          },
        },
        paint: {
          'circle-radius': 10,
          'circle-color': '#3887be',
        },
      })
      if (coords !== undefined) {
        // this is where the code from the next step will go
        const end = {
          type: 'FeatureCollection',
          features: [
            {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'Point',
                coordinates: coords,
              },
            },
          ],
        }
        if (map.getLayer('end')) {
          map.getSource('end').setData(end)
        } else {
          map.addLayer({
            id: 'end',
            type: 'circle',
            source: {
              type: 'geojson',
              data: {
                type: 'FeatureCollection',
                features: [
                  {
                    type: 'Feature',
                    properties: {},
                    geometry: {
                      type: 'Point',
                      coordinates: coords,
                    },
                  },
                ],
              },
            },
            paint: {
              'circle-radius': 10,
              'circle-color': '#f30',
            },
          })
        }
        if (this.employeesValue !== undefined) {
          this.employeesValue.forEach((element) => {
            getRoute(element)
          })
        }
      }
    })
  }

  disconnect() {
    // this.marker.destroy()
    // this.map.destroy()
  }
}
