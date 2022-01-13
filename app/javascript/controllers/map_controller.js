import { Controller } from '@hotwired/stimulus'

import mapboxgl from 'mapbox-gl'
export default class extends Controller {
  static values = {
    token: String,
    latitude: Number,
    longitude: Number,
  }

  connect(e) {
    mapboxgl.accessToken = this.tokenValue //
    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [this.longitudeValue, this.latitudeValue],
      zoom: 8,
    })
    this.marker = new mapboxgl.Marker()
      .setLngLat([this.longitudeValue, this.latitudeValue])
      .addTo(this.map)
  }

  disconnect() {
    this.marker.destroy()
    this.map.destroy()
  }
}
