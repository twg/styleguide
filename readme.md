#TWG Styleguide

Just show me [an example](http://twg.github.io/styleguide/)!

##What is a styleguide?

Front-end frameworks like [Bootstrap](http://getbootstrap.com/) and [Foundation](http://foundation.zurb.com/) are awesome. The most awesome feature of these frameworks is not their plethora of shiny components but instead their thorough documentation. Having extensive front-end documentation helps prevent developers from writing redundant code, makes it easier to on-board new developers to a project, and ensures better communication between front-end and back-end developers.

A styleguide is a page or series of pages that house project documentation. For example, [Mailchimp](http://ux.mailchimp.com/patterns/), [Lonely Planet](http://rizzo.lonelyplanet.com/styleguide/design-elements/colours), and [SalesForce](https://www.lightningdesignsystem.com/) all have thorough and useful styleguides publicly available.

##What is TWG Styleguide

TWG Styleguide is a single CSS file that contains a generic and reusable styleguide theme. Since TWG Styleguide is simply a CSS file it makes no assumptions about your project's tech-stack, this means that you should easily be able to integrate the TWG Styleguide into any project. You can see an [example implementation](http://twg.github.io/styleguide/) of TWG Styleguide here.

##Installation

###Method One: Quick & Dirty

1. Create a new page for your styleguide (the specific method for creating a new page will vary by project).
1. Add `<link rel="stylesheet" href="http://twg.github.io/styleguide/dist/styleguide.css">` to the top of your new page.
1. You may need to manually hide certain elements on the styleguide page. For instance, if your site has a fixed navigation, you may need/want to hide that on the styleguide page.
1. Follow the Custom Elements documentation below to implement the custom TWG Styleguide elements.

Note - the concern with this method is one: GitHub Pages isn't really meant to act as a CDN so the repercussions of using it as such are unclear and two: this file is liable to change at any point in the future (as TWG Styleguide is improved) thus, your styleguide may potentially look broken in the future.

###Method Two: Traditional

1. Run `npm install twg-styleguide --save`
1. Ensure `styleguide.css` is available to your project. For example, you might need to create a gulp task to copy `node_modules/twg-styleguide/dist/styleguide.css` into your project's build directory.
1. Create a new page for your styleguide (the specific method for creating a new page will vary by project).
1. Link to the `styleguide.css` stylesheet on your new styleguide page.
1. You may need to manually hide certain elements on the styleguide page. For instance, if your site has a fixed navigation, you may need/want to hide that on the styleguide page.
1. Follow the Custom Elements documentation below to implement the custom TWG Styleguide elements.

###Integrating with a Front-end Application Framework (Angular, React, Ember)

If you're integrating TWG Styleguide with a front-end application framework, you may run into an issue with the in-page anchor links in the nav not working as expected.

This is caused by the fact that many SPAs (singe page applications) already use a hash to manage the routing (for example `http://example.com/#/about`). So when you try to use an in-page anchor with TWG Styleguide the URL ends up looking something like `http://example.com/#/styleguide#headings`. Since it contains two `#`'s it is invalid and may result in unexpected behavior. There are various ways to fix this depending on which front-end application framework your project is using. For instance, if your project is using AngularJS, see this tutorial on [Pretty URLs](https://scotch.io/quick-tips/pretty-urls-in-angularjs-removing-the-hashtag) to resolve the issue.

##Custom Elements & Classes

Since the `styleguide.css` file will sit alongside any project specific CSS files you have, TWG Styleguide has to go out of its way to ensure that there are not going to be naming conflicts between the two. We do not want your project styles to interfere with the styleguide styles and we do not want the styleguide styles to interfere with your project styles.

To help ensure there are no namespace conflicts, all TWG Styleguide names are prefixed with `sg-` for StyleGuide. To further ensure there are no conflicts, most TWG Styleguide styles are applied via custom elements rather than custom classes.

In general, TWG Styleguide names are identical to existing HTML element names but simply have the `sg-` prefix. For example `<sg-p>` instead of `<p>`. The following is a list of all of the classes and elements that TWG Styleguide provides:

#### Custom Elements

- `<sg-nav>`: The fixed navigation element. If you would like to create sections within the nav, simply group links in a surrounding element such as a `<div>`. The first link in each group will be formatted as a nav group title.

- `<sg-logo>`: Format a logo to sit in the navigation.

- `<sg-section>`: TWG Styleguide section formatting.

- `<sg-h1>` - `<sg-h6>`: Styleguide heading styles. Note - these styles are also available as classes, see `.sg-h1` - `.sg-h6` below.

- `<sg-p>`: TWG Styleguide paragraph formatting.

- `<sg-example>`: Use this element to clearly indicate when you are showcasing an example style or component.

- `<sg-table>`: TWG Styleguide table formatting. `<sg-tr>`, `<sg-td>`, and `<sg-th>` elements are also available to be used in conjunction with `<sg-table>`.

- `<sg-swatch>`: Use this element to display a colour swatch. Swatches require a `border-color` to be specified, this may done via a class or applied as an inline style.

- `<sg-code>`: To share a block of **non-HTML code**, wrap the code in this element (ex. `<sg-code>...</sg-code>`). Note - if using Jade, you can use the [Block in a Tag](http://jade-lang.com/reference/plain-text/) method for multiline code blocks. If you'd like to share a block of HTML code see the `.sg-code` class definition below.

- `<c>`: To share inline code samples use `<c>...</c>`. This renders similarly to the backtick character in GitHub comments. For the sake of brevity, this is the **only** TWG Styleguide name that does not contain the `sg-` prefix.

#### Classes

- `.sg-a`: Apply TWG Styleguide anchor style formatting. Since anchor elements have inherit functionality that we want to maintain, TWG Styleguide uses a class here instead of a custom element.

- `.sg-h1` - `.sg-h6`: TWG Styleguide heading styles. If anchor tags have both a styleguide heading class (ex. `.sg-h1` - `.sg-h6`) and an `href` attribute, they will automatically get an animated hover state. Note - these headings are also available as elements, see `<sg-h1>` - `<sg-h6>` above.

- `.sg-code`: To share blocks of **HTML code** use `<xmp class="sg-code">...</xmp>` (though be aware that the `<xmp>` element [is deprecated](https://developer.mozilla.org/en/docs/Web/HTML/Element/xmp)). Note - if you're sharing non-HTML code use the `<sg-code>` element instead (see above).

##Contributing to TWG Styleguide

If you would like to contribute to the development of the TWG Styleguide itself, please follow these steps:

1. clone this repo: `git clone https://github.com/twg/styleguide.git`
1. checkout a new branch: `git checkout -b YOUR_BRANCH_NAME_HERE`
1. install the dependencies: `npm install`
1. start the dev tasks: `npm start`
1. commit and push your changes when done and submit a PR on GitHub
