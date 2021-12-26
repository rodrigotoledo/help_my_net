# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.0.1/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/actioncable", to: "https://ga.jspm.io/npm:@rails/actioncable@7.0.0/app/assets/javascripts/actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "cable_ready", to: "https://ga.jspm.io/npm:cable_ready@5.0.0-pre8/javascript/index.js"
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.6.1/dist/morphdom.js"
pin "add", to: "https://ga.jspm.io/npm:add@2.0.6/index.js"
pin "stimulus_reflex", to: "https://ga.jspm.io/npm:stimulus_reflex@3.5.0-pre8/javascript/stimulus_reflex.js"
pin "stimulus", to: "https://ga.jspm.io/npm:stimulus@3.0.1/dist/stimulus.js"
pin "stimulus/webpack-helpers", to: "https://ga.jspm.io/npm:stimulus@3.0.1/dist/webpack-helpers.js"
pin "@hotwired/stimulus-webpack-helpers", to: "https://ga.jspm.io/npm:@hotwired/stimulus-webpack-helpers@1.0.1/dist/stimulus-webpack-helpers.js"
