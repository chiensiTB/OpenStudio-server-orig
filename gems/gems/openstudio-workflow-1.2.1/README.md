# OpenStudio::Workflow
[![Circle CI](https://circleci.com/gh/NREL/OpenStudio-workflow-gem/tree/osw.svg?style=svg)](https://circleci.com/gh/NREL/OpenStudio-workflow-gem/tree/osw)
[![Coverage Status](https://coveralls.io/repos/NREL/OpenStudio-workflow-gem/badge.svg?branch=osw&service=github)](https://coveralls.io/github/NREL/OpenStudio-workflow-gem?branch=osw)

## OpenStudio Workflow branch

This branch is the development branch for the OpenStudio 2.0 workflow gem. This will become the primary branch when OpenStudio 2.0 is released.

## Caveats and Todos

### Todos

* Find a better home for monthly_reports.idf
* Fix issues around where standard reports and calibration reports run (and make them optional enabled)
* Move registry into the WorkflowRunner class; this includes logging
* Add a test to ensure that the models being returned contain alterations after apply_measure
* Add unit tests for each util method
* Clean up log messages (and code flow) for @current_state in run.rb
* Define and document the complete set of options for the adapter and run classes
* Implement better error handling with custom exception classes
* Add a results adapter to return a string as the last call based on the source of the call. (e.g. R, command line, C++, etc).

## Testing

The preferred way for testing is to run rspec either natively or via docker. The issue with natively running the tests locally is the requirement to have mongo installed and running.

### Locally

```
rspec spec/
```

### Docker

```
export OPENSTUDIO_VERSION=1.13.0
docker run -v $(pwd):/var/simdata/openstudio \
      nrel/openstudio:$OPENSTUDIO_VERSION \
      /var/simdata/openstudio/test/bin/docker-run.sh
```

## Contributing

1. Fork it ( https://github.com/NREL/OpenStudio-workflow/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
