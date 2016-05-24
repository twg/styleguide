(function () {
  var navElement, linkTarget
  navElement = document.querySelector('sg-nav')

  forEachHeading(function (heading) {
    if (isPrimary(heading)) createNavGroup()
    var navLink = createNavLink(heading)
    var target = linkTarget || navElement
    target.appendChild(navLink)
  })

  function isPrimary (heading) {
    return heading.className.indexOf('sg-h1') > -1
  }

  function createNavGroup () {
    var navGroup = document.createElement('div')
    navElement.appendChild(navGroup)
    linkTarget = navGroup
  }

  function createNavLink (heading) {
    var link = document.createElement('a')
    link.text = heading.text
    link.href = heading.hash
    return link
  }

  function forEachHeading (callback) {
    Array.prototype.slice.call(
      document.querySelectorAll(sgHeadingsSelector())
    ).forEach(callback)
  }

  function sgHeadingsSelector () {
    return [1, 2, 3, 4, 5, 6].map(function (headingNumber) {
      return '.sg-h' + headingNumber
    }).join(', ')
  }
})()
