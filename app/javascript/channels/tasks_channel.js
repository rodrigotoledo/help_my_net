import consumer from './consumer'

var map
var directionsService
var directionsRenderer
var mapContent = document.getElementById('map')
var myLatLng = {
  lat: parseFloat(mapContent.dataset.latitude),
  lng: parseFloat(mapContent.dataset.longitude),
}
var renderObjects = []
var renderObjectsOrigins = []
var activeEmployees = []
var taskEmployees = []
var infowindow = []
var marker = []
function initMap() {
  directionsService = new google.maps.DirectionsService()
  directionsRenderer = new google.maps.DirectionsRenderer()
  map = new google.maps.Map(mapContent, {
    zoom: 15,
    center: myLatLng,
  })
  const contentString =
    '<div>' +
    '<h5 class="firstHeading">' +
    mapContent.dataset.title +
    '</h5>' +
    '<div id="bodyContent">' +
    '<p>' +
    mapContent.dataset.description +
    '</p>'
  '</div>' + '</div>'
  const infowindow = new google.maps.InfoWindow({
    content: contentString,
  })
  const marker = new google.maps.Marker({
    position: myLatLng,
    map,
    title: mapContent.dataset.title,
  })

  marker.addListener('click', () => {
    infowindow.open({
      anchor: marker,
      map,
      shouldFocus: false,
    })
  })
  setMarkers()

  directionsRenderer.setMap(map)
}

function renderDirections(result, employeeId) {
  if (renderObjectsOrigins.includes(employeeId) == false) {
    var directionsRenderer = new google.maps.DirectionsRenderer({ map: map })
    directionsRenderer.setDirections(result)

    renderObjects.push(directionsRenderer)
    renderObjectsOrigins.push(employeeId)
  }
}

function requestDirections(start, end, employeeId) {
  directionsService.route(
    {
      origin: start,
      destination: end,
      travelMode: google.maps.DirectionsTravelMode.DRIVING,
    },
    function (result) {
      renderDirections(result, parseInt(employeeId))
    },
  )
}

function setMarkers() {
  var directionsRendererOptions = {
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  }
  directionsRenderer.setMap(map)

  activeEmployees = document
    .getElementById('active_employees')
    .getElementsByTagName('li')
  taskEmployees = document
    .getElementById('task_employees')
    .getElementsByTagName('li')
  // var task = <%= raw [task.id, task.title, task.address] %>;
  var taskId = mapContent.dataset.id
  var taskTitle = mapContent.dataset.title
  var taskAddress = mapContent.dataset.address
  for (const employee of activeEmployees) {
    const employeeId = employee.dataset.id
    const employeeName = employee.dataset.name
    const employeeAddress = employee.dataset.address
    const employeeLatitude = parseFloat(employee.dataset.latitude)
    const employeeLongitude = parseFloat(employee.dataset.longitude)

    marker[employeeId] = new google.maps.Marker({
      position: { lat: employeeLatitude, lng: employeeLongitude },
      map,
      icon: {
        path: google.maps.SymbolPath.CIRCLE,
        scale: 3,
      },

      title: employeeName,
    })

    const contentString =
      '<div id="task_' +
      mapContent.dataset.id +
      '"><p class="firstHeading">Operador: ' +
      employeeName +
      '</p>' +
      '<button class="btn btn-primary btn-sm" data-task_latitude="' +
      myLatLng['lat'] +
      '" data-task_longitude="' +
      myLatLng['lng'] +
      '"  data-employee_latitude="' +
      employeeLatitude +
      '" data-employee_longitude="' +
      employeeLongitude +
      '" data-task_id="' +
      taskId +
      '" data-employee_id="' +
      employeeId +
      '" data-reflex="click->Employee#associate" data-controller="employee">Active for this task</button></div>'
    infowindow[employeeId] = new google.maps.InfoWindow({
      content: contentString,
    })

    marker[employeeId].addListener('click', () => {
      infowindow[employeeId].open({
        anchor: marker[employeeId],
        map,
        shouldFocus: false,
      })
    })
  }

  for (const employee of taskEmployees) {
    var employeeId = employee.dataset.id
    var employeeName = employee.dataset.name
    var employeeAddress = employee.dataset.address
    var employeeLatitude = parseFloat(employee.dataset.latitude)
    var employeeLongitude = parseFloat(employee.dataset.longitude)

    requestDirections(
      { lat: employeeLatitude, lng: employeeLongitude },
      myLatLng,
      employeeId,
    )
  }
}

consumer.subscriptions.create('TasksChannel', {
  connected() {
    initMap()
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },
})
