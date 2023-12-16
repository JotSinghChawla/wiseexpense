// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// Stimulus controllers
// import "./controllers"

import "@hotwired/turbo-rails"
import "popper"
import "bootstrap"
import "chartkick"
import "Chart.bundle"

// disable data turbo as default
Turbo.session.drive = false