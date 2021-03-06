let str = React.string

@react.component
let make = () => {
  <div className="my-4">
    {str("Docs as FAQ")}
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("Why the builder?")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str(
          "Its super hard to find time updating a personal website. I wanted a simple flow with which I could take out that pain. The editor tries to make the personal website management simple with features like display blogs from Dev.to and projects from Github ",
        )}
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("Hosting with Github")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str(
          "Once you are done with editing click the download button. Commit the 'index.html' file that you downloaded to your github repository. Open Github setting and enable 'Github Pages'. Set source as your 'main' branch and folder as root. Commit the '_redirects' file to your repo. Your site will be live in few minutes. ",
        )}
        <a
          href="https://github.com/bodhish/bodhish.github.io/blob/master/_redirects"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("_redirects file")}
        </a>
        <a
          href="https://vimeo.com/520421685"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer ml-2">
          {str("Watch Video")}
        </a>
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("Hosting with Netlify")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str(
          "Once you are done with editing click the download button. Commit the 'index.html' file that you downloaded to your github repository. Open Netlify and click 'New site from Git' button. Choose your repository from Github and click 'deploy site'. Add 'netlify.toml' file to your repo if you have added a blog. ",
        )}
        <a className="font-bold hover:text-indigo-500 cursor-pointer"> {str("netlify.toml")} </a>
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("How to use import?")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str(
          "You can easly import the index file exported from mytemplate. Click the import button on the top right corner of this page. Enter your Github repositor in the required format and press the check icon on the import tab. This will import the file from Github, once the import is complete you can click the 'Open in Editor' button to complete import. ",
        )}
        <a
          href="https://vimeo.com/520424952"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("Watch Video")}
        </a>
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold"> {str("Tech Stack?")} </div>
      <p className="mt-px tracking-wide text-xs">
        {str("The editor is created with ReasonReact(Rescript) and Tailwind. ")}
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("Where to report Bugs?")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str("Create a issue with details of the bug in ")}
        <a
          href="https://github.com/bodhish/mytemplate.xyz"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("mytemplate repo")}
        </a>
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold">
        {str("Feature requests?")}
      </div>
      <p className="mt-px tracking-wide text-xs">
        {str("Do create an issue explaining the featute in ")}
        <a
          href="https://github.com/bodhish/mytemplate.xyz"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("mytemplate repo")}
        </a>
      </p>
    </div>
    <div className="mt-2">
      <div className="inline-block tracking-wide text-xs font-semibold"> {str("Examples")} </div>
      <div className="mt-px tracking-wide text-xs">
        <a
          href="https://bodhish.in/"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("- bodhish.in")}
        </a>
      </div>
      <div className="mt-px tracking-wide text-xs">
        <a
          href="https://gigin.dev/"
          target="blank"
          className="font-bold hover:text-indigo-500 cursor-pointer">
          {str("- gigin.dev")}
        </a>
      </div>
    </div>
  </div>
}
