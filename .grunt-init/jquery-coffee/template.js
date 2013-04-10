/*
 * grunt-init-jquery-coffee
 * https://rayfran.co
 *
 * Copyright (c) 2013 Franco Bouly
 * Licensed under the MIT license.
 */

// Basic template description.
exports.description = 'Quickly create a single file jQuery plugin written in coffeescript';

// Template-specific notes to be displayed before question prompts.
exports.notes = 'Ready? Get set.';

// Template-specific notes to be displayed after question prompts.
exports.after = 'Enjoy baby !';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {

  init.process({type: 'jquery'}, [
    // Prompt for these values.
    init.prompt('name'),
    init.prompt('title', function(value, data, done) {
      // Fix jQuery capitalization.
      value = value.replace(/jquery/gi, 'jQuery');
      done(null, value);
    }),
    init.prompt('description', 'The best jQuery plugin ever.'),
    init.prompt('version','0.0.1'),
    init.prompt('repository'),
    init.prompt('homepage'),
    init.prompt('licenses', 'MIT'),
    init.prompt('author_name'),
    init.prompt('author_email'),
    init.prompt('author_url'),
    init.prompt('jquery_version')
  ], function(err, props) {
    // A few additional properties.
    props.className = props.name.charAt(0).toUpperCase() + props.name.slice(1);
    props.name = props.name.toLowerCase();

    // Files to copy (and process).
    var files = init.filesToCopy(props);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // All done!
    done();
  });
};