// Import and register all your controllers from the importmap under controllers/*
import { Application } from '@hotwired/stimulus'
// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from '@hotwired/stimulus-loading'
import StimulusReflex from 'stimulus_reflex'
import consumer from '../channels/consumer'
import controller from '../controllers/application_controller'
import CableReady from 'cable_ready'

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

eagerLoadControllersFrom('controllers', application)

StimulusReflex.initialize(application, { consumer, controller, isolate: true })
CableReady.initialize({ consumer })

// process.env.RAILS_ENV wont exist in importmaps.
// StimulusReflex.debug = process.env.RAILS_ENV === 'development'
