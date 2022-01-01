// Import and register all your controllers from the importmap under controllers/*

import { application } from 'controllers/application'

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from '../controllers/application_controller'
import CableReady from 'cable_ready'
eagerLoadControllersFrom('controllers', application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
application.consumer = consumer
StimulusReflex.initialize(application, { controller, isolate: true })
StimulusReflex.debug = process.env.RAILS_ENV === 'development'
CableReady.initialize({ consumer })