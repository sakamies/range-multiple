# range-multiple

HTML5 range input with multiple handles. Using two range inputs and svg to visualize the range. Configurable &amp; accessible.

I'm using riot.js just because it had so little boilerplate to make something demoable, but there's nothing riot specific to doing a range with multiple values this way. You should look at the `range.tag` template to figure out how to use it with other frameworks. There's really no business logic involved in displaying the range component, just fill in the `{vars}` and resolve the ifs. Should be really easy to convert to for example handlebars.

The only caveat in the code is that Riot or Chrome choked on the viewbox (required for the range visualization to work) attribute, so I'm setting that in the init/mount function, instead of in the template.

TODO: More readme. :)
