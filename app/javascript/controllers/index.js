// Import and register all your controllers from the importmap under controllers/*
import { Application } from '@hotwired/stimulus'

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading'
import consumer from '../channels/consumer'
import controller from '../controllers/application_controller'
import CableReady from 'cable_ready'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

eagerLoadControllersFrom('controllers', application)
// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
import { lazyLoadControllersFrom } from '@hotwired/stimulus-loading'
lazyLoadControllersFrom('controllers', application)
CableReady.initialize({ consumer })