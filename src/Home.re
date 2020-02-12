let str = React.string;
let logo: string = [%raw "require('./assets/logo.jpeg')"];

[@react.component]
let make = () =>
  <div>
    <div
      className="bg-indigo-900 flex flex-col h-screen justify-center items-center text-center">
      <div>
        <h1
          className="text-5xl hover:text-green-500 text-white flex items-center">
          {"Bodhish Thomas" |> str}
        </h1>
      </div>
      <div>
        {Data.socials()
         |> Array.map(social =>
              <a href={social |> Data.url} target="_blank">
                <i
                  className={
                    "m-4 text-3xl text-white hover:text-green-500 fab fa-"
                    ++ (social |> Data.icon)
                  }
                />
              </a>
            )
         |> React.array}
      </div>
    </div>
    <div className="p-10 bg-gray-100">
      <div className="text-center">
        <h1 className="text-5xl text-indigo-900">
          {"Products Built" |> str}
        </h1>
      </div>
      <div className="flex flex-row justify-center items-center flex-wrap">
        {Data.projects()
         |> Array.map(project =>
              <div className="flex p-2 justify-center items-center flex-wrap">
                <div
                  className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
                  <img
                    className=" "
                    src={project |> Data.projectImage}
                    alt={project |> Data.projectTitle}
                  />
                  <div className="px-6 py-4">
                    <div className="font-bold text-xl mb-2">
                      {project |> Data.projectTitle |> str}
                    </div>
                    <p className="text-700 text-base">
                      {project |> Data.projectDescription |> str}
                    </p>
                    <p>
                      {project
                       |> Data.projectLinks
                       |> Array.map(link =>
                            <a href={link |> Data.url} target="_blank">
                              <i
                                className={
                                  "mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 "
                                  ++ (link |> Data.icon)
                                }
                              />
                            </a>
                          )
                       |> React.array}
                    </p>
                  </div>
                  <div className="px-6 py-4">
                    {project
                     |> Data.projectTags
                     |> Array.map(tag =>
                          <span
                            className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2">
                            {tag |> str}
                          </span>
                        )
                     |> React.array}
                  </div>
                </div>
              </div>
            )
         |> React.array}
      </div>
    </div>
  </div>;

// <div className="flex flex-row justify-center items-center flex-wrap bg-white">
//   <div className="flex p-2 justify-center items-center flex-wrap">
//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img className=" " src="./assets/0100.jpg" alt="StopFaking" />
//       <div className="px-6 py-4">
//         <div className="font-bold text-xl mb-2">StopFaking</div>
//         <p className="text-700 text-base">
//           A bot built on Facebook messenger platform that <br />
//           can help you identify fake news shared by others <br />
//           on Facebook.
//         </p>
//         <p>
//           <a href="http://stopfaking.in" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a href="https://m.me/stopfaking.in" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-facebook-messenger"
//             ></i
//           ></a>
//         </p>
//       </div>

//       <div className="px-6 py-4">
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >FacebookBot</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >RubyOnRails</span
//         >
//       </div>
//     </div>

//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img
//         className=" "
//         src="./assets/ayushma-logo.jpg"
//         alt="afterflood"
//       />
//       <div className="px-6 py-4">
//         <div className="mt-2 font-family-sans font-bold text-xl mb-2">
//           Afterflood
//         </div>
//         <p className="text-700 text-base">
//           A verified crowd sourced data hub for after flood recovery. Built
//           in 4 hrs to support 2018 Kerala Flood recovery which got 1M page
//           visits in 4 days.
//         </p>
//         <p>
//           <a href="https://afterflood.in" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a href="http://chat.afterflood.in/" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-facebook-messenger"
//             ></i
//           ></a>
//           <a href="https://info.afterflood.in" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-info-circle"
//             ></i
//           ></a>
//           <a
//             href="https://github.com/afterflood/afterflood.in"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-github"
//             ></i
//           ></a>
//         </p>
//       </div>
//       <div className="px-6 py-4">
//         <span
//           className="mb-2 inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700"
//           >Supported By Cloudflare Project Galileo</span
//         >
//       </div>
//     </div>

//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img className=" " src="./assets/ayushma-logo-1.jpg" alt="Ayushma" />
//       <div className="px-6 py-4">
//         <div className="font-bold text-xl mb-2">Ayushma</div>
//         <p className="text-700 text-base">
//           'AYUSHMA' your one touch Healthcare assistant is a digital
//           platform which links the patients, doctors, hospitals, and
//           insurance companies in a single go.
//         </p>
//         <p>
//           <a href="http://bodhish.in/Ayushma-website/" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a
//             href="https://www.youtube.com/watch?v=zvV64D_qMko"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-youtube"
//             ></i
//           ></a>
//           <a
//             href="https://www.youtube.com/watch?time_continue=5&v=0HamRsRgyLY"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-mobile-alt"
//             ></i
//           ></a>
//         </p>
//       </div>
//       <div className="px-6 py-4">
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >RubyOnRails</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >ReactNative</span
//         >
//       </div>
//     </div>

//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img
//         className=" "
//         src="./assets/occult.jpg"
//         alt="Sunset in the mountains"
//       />
//       <div className="px-6 py-4">
//         <div className="font-bold text-xl mb-2">OCCULT</div>
//         <p className="text-700 text-base">
//           Augmented Reality Treasure Hunt based on the famous locations on
//           bangalore. SAAS solution for event organizers to host tech based
//           treasure hunt.
//         </p>
//         <p>
//           <a href="http://bodhish.in/Occulut-Website/" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a
//             href="https://www.youtube.com/watch?v=viY_inJsxEU"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-youtube"
//             ></i
//           ></a>
//           <a
//             href="https://play.google.com/store/apps/details?id=in.creslainfotech.occult"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-google-play"
//             ></i
//           ></a>
//         </p>
//       </div>
//       <div className="px-6 py-4">
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >AR</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >Unity</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700"
//           >C#</span
//         >
//       </div>
//     </div>

//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img
//         className=" "
//         src="./assets/cortex-1.jpg"
//         alt="Sunset in the mountains"
//       />
//       <div className="px-6 py-4">
//         <div className="font-bold text-xl mb-2">Cortex</div>
//         <p className="text-700 text-base">
//           First ever dual character controlled single player infinite runner
//           game. Integrated with multi level gamification which could help
//           the player to be ambidextrous
//         </p>
//         <p>
//           <a
//             href="https://www.producthunt.com/posts/cortex-first-ever-dual-character-controlled-single-player-infinite-runner-game"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a
//             href="https://www.youtube.com/watch?v=4txVsa8s3ME"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-youtube"
//             ></i
//           ></a>
//           <a
//             href="https://play.google.com/store/apps/details?id=com.eightstags.cortexnew"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-google-play"
//             ></i
//           ></a>
//           <a href="https://github.com/bodhish/CORTEX-Code" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-github"
//             ></i
//           ></a>
//         </p>
//       </div>
//       <div className="px-6 py-4">
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >Unity</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >C#</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >FOOS</span
//         >
//       </div>
//     </div>

//     <div className="m-4 max-w-sm rounded overflow-hidden shadow-lg">
//       <img
//         className=" "
//         src="./assets/stylist.jpg"
//         alt="Sunset in the mountains"
//       />
//       <div className="px-6 py-4">
//         <div className="font-bold text-xl mb-2">The Stylist</div>
//         <p className="text-700 text-base">
//           A stylist booking platform developed for salons and freelancing
//           stylist to manage appointments online built in 2016
//         </p>
//         <p>
//           <a href="#" target="_blank">
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fas fa-external-link-square-alt"
//             ></i
//           ></a>
//           <a
//             href="https://www.youtube.com/watch?v=U3m68Xz91GA&feature=youtu.be"
//             target="_blank"
//           >
//             <i
//               className="mt-4 ml-2 mr-2 text-4xl text-gray-500 hover:text-green-500 fab fa-youtube"
//             ></i
//           ></a>
//         </p>
//       </div>
//       <div className="px-6 py-4">
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >PAAS</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700 mr-2"
//           >Android Native</span
//         >
//         <span
//           className="inline-block bg-gray-200 rounded-full px-3 py-1 text-sm font-semibold text-700"
//           >PHP</span
//         >
//       </div>
//     </div>
//   </div>
// </div>

// <div className="m-10 flex justify-center items-center">
//     <h1 className="text-5xl text-indigo-900 flex items-center">
//         Contributions
//     </h1>
// </div>

// <div className="mt-10  flex flex-row flex-wrap">
//   <div className="flex w-full justify-center items-center mr-auto bg-white">
//     <div className="flex flex-row flex-wrap justify-center items-center mx-auto">
//     <a href="https://github.com/SVdotCO">
//       <img className="m-6 p-4" src="https://avatars0.githubusercontent.com/u/6406953?s=50&v=4" alt="svCo">
//     </a>
//     <a href="https://github.com/kikrfit">
//       <img className="m-6 p-4" src="https://avatars3.githubusercontent.com/u/46489055?s=50&v=4" alt="Kiktfit">
//     </a>
//     <a href="https://github.com/KSITM">
//       <img className="m-6 p-4" src="https://avatars1.githubusercontent.com/u/42405345?s=50&v=4" alt="KSITM">
//     </a>
//     <a href="https://github.com/afterflood">
//       <img className="m-6 p-4" src="https://avatars3.githubusercontent.com/u/42554284?s=50&v=4" alt="Ayushma">
//     </a>
//     <a href="https://github.com/reasonml/">
//       <img className="m-6 p-4" src="https://avatars3.githubusercontent.com/u/20414525?s=50&v=4" alt="ReasonML">
//     </a>
//     <a href="https://github.com/IEEEKeralaSection">
//       <img className="m-6 p-4" src="https://avatars3.githubusercontent.com/u/42405496?s=50&v=4" alt="IEEE">
//     </a>
//   </div>
// </div>
// </div>

// <div className="flex justify-center items-center">
//   <p className="text-center text-gray-500 text-xs m-5">
//     ©2019 bodhi. All rights reserved.
