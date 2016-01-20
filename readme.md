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

##Custom Elements

- `<sg-nav>`: The fixed navigation element. If you would like to create sections within the nav, simply group links in a surrounding element such as a `<div>`. The first link in each group will be formatted as a nav group title.

- `<sg-a>`: Anchor style formatting. Can also be applied via the class `.sg-a`.

- `<sg-h1>` - `<sg-h6>`: Styleguide heading styles. These can also be applied as classes with the same name, for example `.sg-h3`. If anchor tags have both a styleguide heading class (`.sg-h1` - `.sg-h6`) and and `href` attribute, they will automatically get an animated hover state.

- `<sg-p>`: TWG Styleguide paragraph formatting.

- `<sg-section>`: TWG Styleguide section formatting.

- `.sg-code`: TWG Styleguide code block formatting. There is also the shortform element `<c></c>` that will apply the same code formatting (you can think of this as the backtick character in GitHub's markdown parser). If you would like to present a block of code, use the `<xmp>` element with the class of `.sg-code`: `<xmp class="sg-code"></xmp>`. Note - if using Jade, you can use the [Block in a Tag](http://jade-lang.com/reference/plain-text/) method for multiline code samples.

- `<sg-table>`: TWG Styleguide table formatting. `<sg-tr>`, `<sg-td>`, and `<sg-th>` elements are also available to be used in conjunction with `<sg-table>`.

- `<sg-swatch>`: Format a colour swatch. Swatches require a `border-color` to be specified, this may done via a class or applied inline.

- `<sg-logo>`: Format a logo to sit in the navigation.

##Development

If you would like to contribute to the development of the TWG Styleguide itself, follow these steps:

1. clone this repo: `git clone https://github.com/twg/styleguide.git`
1. checkout a new branch: `git checkout -b YOUR_BRANCH_NAME_HERE`
1. install the dependencies: `npm install`
1. start the dev tasks: `npm start`
1. commit and push your changes when done and submit a PR on GitHub
