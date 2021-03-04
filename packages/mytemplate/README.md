# mytemplate.xyz

A simple website builder for developers.

## Example

![](https://res.cloudinary.com/bodhi/image/upload/v1590789174/apps/mytemplate.xyz/Screenshot_from_2020-05-30_03-19-47_lvbeme.png)
[http://bodhish.in/](http://bodhish.in/)

[Source code for the preview](https://github.com/bodhish/bodhish.github.io/blob/master/index.html)

## Steps

### 1. Create an `Index.html` file for your website and the basics

```
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width initial-scale=1" />
    <title>Your Name</title>
  </head>
  <body>
  </body>
</html>
```

### 2. Import mytemplate.xyz and customize the data

```
 <script type="application/json" id="my-template-data">
      {
        "name": "Bodhish Thomas",
        "primaryColor": "indigo",
        "socialLinks": [
          "https://github.com/bodhish",
          "https://www.npmjs.com/~bodhish",
          "https://twitter.com/bodhishthomas",
        ],
        "repositories": [
          "SVdotCO/pupilfirst",
          "afterflood/afterflood.in",
          "coronasafe/care_fe",
          "bodhish/create-reason-react-tailwind"
        ],
        "devToUserId": "bodhish"
      }
    </script>
    <div id="root"></div>
    <script src="https://cdn.jsdelivr.net/npm/mytemplate.xyz@0.0.5/build/Index.js"></script>
```

### 3. Deploy the site to netlify or github pages

## Options

| name         | string           | Your full name                                                        |
| ------------ | ---------------- | --------------------------------------------------------------------- |
| primaryColor | optional(string) | black/white/gray/red/orange/yellow/green/teal/blue/indigo/purple/pink |
| Social Links | array(string)    | Your socials links                                                    |
| devToUserId  | optional(string) | Your Dev.to user id                                                   |
| repositories | array(string)    | The repositories you want to showcase                                 |
| products     | array(product)   | You can showcase your products                                        |

### Products

| title       | string           | Your product name                          |
| ----------- | ---------------- | ------------------------------------------ |
| description | optional(string) | Your product description                   |
| logo        | string           | logo link for your product                 |
| tags        | array(string)    | Tags that you want to add for your product |
| links       | array(string)    | Social links for the product               |

## Source

[https://github.com/bodhish/mytemplate.xyz](https://github.com/bodhish/mytemplate.xyz)
