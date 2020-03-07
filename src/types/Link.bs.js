'use strict';

var $$Array = require("bs-platform/lib/js/array.js");

function name(t) {
  return t[/* name */0];
}

function icon(t) {
  return t[/* icon */1];
}

function url(t) {
  return t[/* url */2];
}

function test(value, url) {
  var tester = new RegExp(value);
  return tester.test(url);
}

function make(url) {
  var match = test("twitter", url) ? /* tuple */[
      "fab fa-twitter",
      "Twitter"
    ] : (
      test("facebook", url) ? /* tuple */[
          "fab fa-facebook-f",
          "Facebook"
        ] : (
          test("instagram", url) ? /* tuple */[
              "fab fa-instagram",
              "Instagram"
            ] : (
              test("youtube", url) ? /* tuple */[
                  "fab fa-youtube",
                  "Youtube"
                ] : (
                  test("linkedin", url) ? /* tuple */[
                      "fab fa-linkedin",
                      "Linkedin"
                    ] : (
                      test("snapchat", url) ? /* tuple */[
                          "fab fa-snapchat",
                          "Snapchat"
                        ] : (
                          test("tumblr", url) ? /* tuple */[
                              "fab fa-tumblr",
                              "Tumblr"
                            ] : (
                              test("pinterest", url) ? /* tuple */[
                                  "fab fa-pinterest",
                                  "Pinterest"
                                ] : (
                                  test("reddit", url) ? /* tuple */[
                                      "fab fa-reddit",
                                      "Reddit"
                                    ] : (
                                      test("flickr", url) ? /* tuple */[
                                          "fab fa-flickr",
                                          "Flickr"
                                        ] : (
                                          test("messenger", url) ? /* tuple */[
                                              "fab fa-facebook-messenger",
                                              "Messenger"
                                            ] : (
                                              test("chat", url) ? /* tuple */[
                                                  "fab fa-facebook-messenger",
                                                  "Chat"
                                                ] : (
                                                  test("info", url) ? /* tuple */[
                                                      "fa fa-info-circle",
                                                      "Info"
                                                    ] : (
                                                      test("github", url) ? /* tuple */[
                                                          "fab fa-github",
                                                          "Github"
                                                        ] : (
                                                          test("play", url) ? /* tuple */[
                                                              "fab fa-google-play",
                                                              "Google Play"
                                                            ] : (
                                                              test("npm", url) ? /* tuple */[
                                                                  "fab fa-npm",
                                                                  "npm"
                                                                ] : (
                                                                  test("medium", url) ? /* tuple */[
                                                                      "fab fa-medium",
                                                                      "Medium"
                                                                    ] : /* tuple */[
                                                                      "fas fa-external-link-square-alt",
                                                                      url
                                                                    ]
                                                                )
                                                            )
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    );
  return /* record */[
          /* name */match[1],
          /* icon */match[0],
          /* url */url
        ];
}

function makeArray(links) {
  return $$Array.map(make, links);
}

exports.name = name;
exports.icon = icon;
exports.url = url;
exports.test = test;
exports.make = make;
exports.makeArray = makeArray;
/* No side effect */
