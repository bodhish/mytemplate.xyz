# No-Code Developer Website Builder

[MyTemplate.xyz](myTemplate.xyz) is a no-code website builder designed specifically for developers. Leveraging the power of ReScript and TailwindCSS, it simplifies the process of creating and updating personal websites. By integrating with platforms like Dev.to and GitHub, it offers a seamless experience for showcasing blogs and projects.

## Why?

- **Time-Saving**: Updating personal websites can be time-consuming. MyTemplate.xyz offers a streamlined process to manage your website efficiently.
- **Integration**: Display your blogs from Dev.to and projects directly from GitHub.
- **Ease of Use**: A user-friendly editor makes website management straightforward.

## Hosting Your Site

### GitHub Pages

1. Edit your site and click the 'Download' button.
2. Commit the downloaded 'index.html' to your GitHub repository.
3. In GitHub settings, enable 'GitHub Pages'.
4. Set the source to your 'main' branch and the folder to root.
5. Commit the '\_redirects' file to your repo.
6. Your site will be live shortly. [Watch Video](https://vimeo.com/520421685)

### Netlify

1. After editing, click the 'Download' button.
2. Commit the 'index.html' file to your GitHub repository.
3. On Netlify, select 'New site from Git'.
4. Choose your GitHub repository and click 'Deploy site'.
5. Add 'netlify.toml' to your repo for blog integration. [Learn More](#)

## Importing Your Site

1. Click 'Import' on the top right of this page.
2. Enter your GitHub repository in the required format.
3. Press the check icon on the import tab.
4. After import, click 'Open in Editor' to finalize. [Watch Video](#)

## Technology Stack

- **Frontend**: React (ReScript)
- **Styling**: TailwindCSS

## Support and Contributions

- **Bug Reports**: Please create an issue with bug details.
- **Feature Requests**: Suggestions are welcome. Create an issue in the with your ideas.

## Examples

- [bodhish.in](bodhish.in)
- [gigin.dev](gigin.dev)

> send a PR to add your site here

# Run the project

```sh
yarn install
yarn dev
```

You may need to run `yarn run re:watch` in a separate terminal to watch for changes in the `src` directory.

The project is written in [ReScript](https://rescript-lang.org/)
