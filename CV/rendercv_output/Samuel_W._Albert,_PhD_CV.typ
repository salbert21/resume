
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Samuel W. Albert, PhD"
#let locale-catalog-page-numbering-style = context { "Samuel W. Albert, PhD - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Nov 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-partial-line"
#let design-section-titles-vertical-space-above = 0.5cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-small-caps-for-name = false
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-nested-bullet = "-"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.25cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 1.2em
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = true
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-nested-bullet,
  spacing: design-highlights-vertical-space-between-highlights,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let bullet-entry(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: 0pt,
    indent: 0pt,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #if design-header-small-caps-for-name [
    #smallcaps(it.body)
  ] else [
    #it.body
  ]
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-partial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Samuel W. Albert, PhD

// Print connections:
#let connections-list = (
  [#fa-icon("location-dot", size: 0.9em) #h(0.05cm)Washington, DC],
  [#box(original-link("mailto:samuelalbert21@gmail.com")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)samuelalbert21\@gmail.com])],
  [#box(original-link("tel:+1-615-260-6341")[#fa-icon("phone", size: 0.9em) #h(0.05cm)\(615\) 260-6341])],
  [#box(original-link("https://www.dcsa.mil/")[#fa-icon("lock", size: 0.9em) #h(0.05cm)TS\/SCI clearance])],
)
#connections(connections-list)



== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[University of Colorado Boulder], Aerospace Engineering Sciences
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Advisor: Dr. Hanspeter Schaub, Dr. Robert D. Braun])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([#link("https://www.proquest.com/dissertations-theses/aerocapture-entry-co-delivery-uncertain-planetary/docview/2901743208/se-2")[#emph[Aerocapture, Entry, and Co-Delivery in Uncertain Planetary Atmospheres]]],[NASA Space Technology Research Fellow],[Five first-author papers in peer-reviewed journals],[#link("https://www.colorado.edu/aerospace/2022/05/05/smead-aerospace-class-2022-awards")[John A. Vise Award]],)
  ],
  right-content: [
    Boulder, CO

May 2020 – Sept 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[MS]],
  middle-content: [
    #strong[University of Colorado Boulder], Aerospace Engineering Sciences
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Graduate Certificate in Astrodynamics and Satellite Navigation Systems],[#link("https://matthewisakowitzfoundation.org/")[Matthew Isakowitz Fellow]],)
  ],
  right-content: [
    Boulder, CO

Aug 2018 – May 2020
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Purdue University], Aeronautical and Astronautical Engineering
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Honors College Graduate])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Minor: Global Engineering Studies],[Exchange semester at Universidad de Carlos III, Madrid, Spain],[#link("https://www.stampsscholars.org/")[Stamps Scholar] \(full-ride scholarship\)],)
  ],
  right-content: [
    West Lafayette, IN 

Aug 2014 – May 2018
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Johns Hopkins University Applied Physics Laboratory], Senior Aerospace Engineer
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [#emph[Director's Special Achievement Award, Sept. 2025]])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Flight Performance Analyst on NASA Dragonfly Mobility Team -- performs Monte Carlo analyses, sensitivity studies, and flight envelope sweeps for rotorcraft on Titan],[Co-PI of 2-year joint IRAD with UMD -- leads team in using neural radiance fields to render high-fidelity multi-spectral dynamic spacecraft scenes],[Applies mission design, orbit estimation, and mission concept development to a variety of national security space missions\/projects],)
  ],
  right-content: [
    Laurel, MD

Sept 2023 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[NASA], Visiting Technologist\/Intern \(multiple\)
    #v(-design-text-leading)

    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Research collaboration with NASA Langley and NASA JPL; Summer 2019 intern at JPL])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Co-developed novel guidance algorithm for drag-modulated aerocapture and implemented in C++ for use in DSENDS aerocapture simulation],[Performed flight-mechanics analysis and trajectory design for the Small High Impact Energy Landing Device \(SHIELD\) concept],[Designed aerocapture trajectories for Uranus orbiter \"A Team\" pre-decadal study],)
  ],
  right-content: [
    Remote \/ Pasadena, CA

2019-2022 \(various\)
  ],
)



== Journal Articles


#two-col-entry(
  left-content: [
    #strong[Dimensionality Reduction for Onboard Modeling of Uncertain Atmospheres]

  ],
  right-content: [
    2025
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Alireza Doostan, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/1.A35839")[10.2514/1.A35839] (AIAA Journal of Spacecraft and Rockets)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Energy Reference Guidance for Drag-Modulated Aerocapture]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Ethan Burnett, Hanspeter Schaub, P. Daniel Burkhart, Alex Austin

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.asr.2023.09.034")[10.1016/j.asr.2023.09.034] (Advances in Space Research)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Co-Delivery of a Martian Probe Network]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/1.A35560")[10.2514/1.A35560] (AIAA Journal of Spacecraft and Rockets)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Relative Motion in the Velocity Frame for Atmospheric Entry Trajectories]

  ],
  right-content: [
    2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/1.A35753")[10.2514/1.A35753] (AIAA Journal of Spacecraft and Rockets)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Flight Mechanics Feasibility Assessment for Co-Delivery of Direct-Entry Probe and Aerocapture Orbiter]

  ],
  right-content: [
    2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub, Robert D. Braun

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/1.A34953")[10.2514/1.A34953] (AIAA Journal of Spacecraft and Rockets)])



== Conference Papers


#two-col-entry(
  left-content: [
    #strong[Onboard Density Modeling for Planetary Entry via Karhunen-Loève Expansion]

  ],
  right-content: [
    March 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Alireza Doostan, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/AERO55745.2023.10115794")[10.1109/AERO55745.2023.10115794] (IEEE Aerospace Conference, Big Sky, MT)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Relative Motion on Highly-Eccentric Atmospheric Entry Trajectories]

  ],
  right-content: [
    January 2023
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/Albert2023.pdf")[hanspeterschaub.info/Papers/Albert2023.pdf] (AAS\/AIAA Space Flight Mechanics Meeting, Austin, TX)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Maneuver Design and Flight Control for a Martian Probe Network]

  ],
  right-content: [
    August 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/Albert2022b.pdf")[hanspeterschaub.info/Papers/Albert2022b.pdf] (AAS\/AIAA Astrodynamics Specialist Conference, Charlotte, NC)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[A New Guidance Technique for Discrete-Event Drag Modulation for Aerocapture Missions]

  ],
  right-content: [
    February 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Ethan R. Burnett, Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1007/978-3-031-51928-4_50")[10.1007/978-3-031-51928-4_50] (AAS Guidance, Navigation, and Control Conference, Breckenridge, CO)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Co-Delivery of Multiple Small Probes to the Martian Surface]

  ],
  right-content: [
    January 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2022-1653")[10.2514/6.2022-1653] (AIAA SciTech, San Diego, CA)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Linear Covariance Analysis of Entry and Aerocapture Trajectories in an Uncertain Atmosphere]

  ],
  right-content: [
    January 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Jack Ridderhof, Samuel W. Albert, Panagiotis Tsiotras, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2022-1216")[10.2514/6.2022-1216] (AIAA SciTech, San Diego, CA)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Finite-Dimensional Density Representation for Aerocapture Uncertainty Quantification]

  ],
  right-content: [
    January 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Alireza Doostan, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2021-0932")[10.2514/6.2021-0932] (AIAA SciTech, Nashville, TN)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[AeroDrop: Prospects and Challenges for Co-Delivery of Probe and Orbiter via Aerocapture]

  ],
  right-content: [
    August 2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Robert D. Braun, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/Albert2020.pdf")[hanspeterschaub.info/Papers/Albert2020.pdf] (AAS\/AIAA Astrodynamics Specialist Conference, Lake Tahoe, CA)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Comparative Study of Lift- and Drag-Modulation Control Strategies for Aerocapture]

  ],
  right-content: [
    February 2020
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Casey R. Heidrich, Evan Roelke, Samuel W. Albert, Robert D. Braun

#v(design-highlights-top-margin - design-text-leading)AAS Guidance, Navigation, and Control Conference, Breckenridge, CO])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Conceptual Development of AeroDrop: Aerocapture and Direct Entry for Two Spacecraft on a Common Approach Trajectory]

  ],
  right-content: [
    January 2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Robert D. Braun

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2020-1737")[10.2514/6.2020-1737] (AIAA SciTech, Orlando, FL)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Aerodynamic Breakup and Secondary Drop Formation for a Liquid Metal Column in a Shock-Induced Cross-Flow]

  ],
  right-content: [
    January 2017
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Yi Chen, Edward P. DeMauro, ustin L. Wagner, Marco Arienti, Daniel R. Guildenbecher, Paul Farias, Thomas W. Grasser, Patrick Sanderson, Samuel W. Albert, Aaron Turpin, William Sealy, Remington S. Ketchum

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2017-1892")[10.2514/6.2017-1892] (AIAA Aerospace Sciences, Grapevine, TX)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Measurements of the Initial Transient of a Dense Particle Curtain Following Shock Wave Impingement]

  ],
  right-content: [
    January 2017
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Edward P. DeMauro, Justin L. Wagner, Lawrence J. DeChant, Steven J. Beresh, Paul Farias, Aaron Turpin, William Sealy, Samuel W. Albert, Patrick Sanderson

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2017-1466")[10.2514/6.2017-1466] (AIAA Aerospace Sciences, Grapevine, TX)])



== Other Papers\/Presentations


#two-col-entry(
  left-content: [
    #strong[Relative Motion About Aerocapture and Entry Trajectories]

  ],
  right-content: [
    August 2023
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)International Planetary Probe Workshop, Marseille, France. Oral Presentation])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(#emph[Best Student Presentation Award]\) Entry Flight Mechanics Analysis for SHIELD: Small High Impact Energy Landing Device]

  ],
  right-content: [
    August 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/IPPW22_AlbertSchaub.pdf")[hanspeterschaub.info/Papers/IPPW22_AlbertSchaub.pdf] (International Planetary Probe Workshop, Silicon Valley, CA. Oral Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Aerocapture Simulation in Basilisk, an Open-Source Astrodynamics Framework]

  ],
  right-content: [
    August 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Mikaela Felix, Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/IPPW22_MikaelaFelix.pdf")[hanspeterschaub.info/Papers/IPPW22_MikaelaFelix.pdf] (International Planetary Probe Workshop, Silicon Valley, CA. Poster Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Efficient Delivery of a Network of Small Probes to the Martian Surface]

  ],
  right-content: [
    March 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/AlbertSchaub_poster_2022.pdf")[hanspeterschaub.info/Papers/AlbertSchaub_poster_2022.pdf] (Low-Cost Science Mission Concepts for Mars Exploration workshop, Pasadena, CA. Poster Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Revolutionizing Access to the Mars Surface]

  ],
  right-content: [
    March 2022
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Christopher J. Culbert, Bethany L. Ehlmann, Abigail A. Fraeman, Samuel W. Albert, Don Banfield, Jonathan Bapst, Dave Bearden, Kevin Bonnet, Joel Burdick, Wendy Calvin, Barbara Cohen, Tim Crain, Charles Edwards, Giusy Falcone, Elizabeth Frank, Andrew Horchler, Mark Johnson, Brett Kennedy, Laura Kerber, Rob Manning, David Masten, Larry Matthies, Michelle Munk, David Murrow, Paul Niles, Mark Panning, Zachary Putnam, Eva Scheller, Rachel Sheppard, Nathan Stein, Skylar Wei, Ryan Woolley, Paul Wooster

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.7907/d1sm-mj77")[10.7907/d1sm-mj77] (Final Workshop Report for the W.M. Keck Institute for Space Studies)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Designing Probe and Orbiter for a Single Entry Trajectory]

  ],
  right-content: [
    September 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.7907/d1sm-mj77")[10.7907/d1sm-mj77] (AIAA Rocky Mountain Annual Technical Symposium, Boulder, CO. Oral Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Co-Delivery of Probe and Orbiter via Aerocapture for Interplanetary Missions]

  ],
  right-content: [
    July 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Robert D. Braun, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/Albert2021c.pdf")[hanspeterschaub.info/Papers/Albert2021c.pdf] (International Plentary Probe Workshop, Virtual. Oral Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[One Approach Trajectory, Multiple Vehicles]

  ],
  right-content: [
    March 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, Robert D. Braun, Hanspeter Schaub

#v(design-highlights-top-margin - design-text-leading)#link("https://hanspeterschaub.info/Papers/Albert2021c.pdf")[hanspeterschaub.info/Papers/Albert2021c.pdf] (Revolutionizing Access to the Martian Surface Workshop, W. M. Keck Institute for Space Studies. Poster Presentation.)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Enabling and Enhancing Science Exploration Across the Solar System: Aerocapture Technology for SmallSat to Flagship Missions]

  ],
  right-content: [
    March 2021
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Alex Austin et al.

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/https://doi.org/10.3847/25c2cfeb.4b23741d")[https://doi.org/10.3847/25c2cfeb.4b23741d] (White Paper for the Planetary Science Decadal Survey, 2023-2032)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Aerocapture as an Enhancing Option for Ice Giants Missions]

  ],
  right-content: [
    July 2020
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Soumyo Dutta et al.

#v(design-highlights-top-margin - design-text-leading)#link("https://ntrs.nasa.gov/citations/20205002647")[ntrs.nasa.gov/citations/20205002647] (White Paper for the Planetary Science Decadal Survey, 2023-2032)])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[AeroDrop: Dual Aerocapture-Entry Architecture for Multiple Spacecraft Missions]

  ],
  right-content: [
    July 2019
  ],
)
#one-col-entry(content:[
  #v(design-highlights-top-margin);Samuel W. Albert, Robert D. Braun

#v(design-highlights-top-margin - design-text-leading)International Planetary Probe Workshop, Oxford, UK. Poster Presentation])

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Survey of Microbial Environment for Crew Health at the Mars Desert Research Station]

  ],
  right-content: [
    April 2018
  ],
)
#one-col-entry(content:[
#v(design-highlights-top-margin);Samuel W. Albert, D. Marshall Porterfield

#v(design-highlights-top-margin - design-text-leading)#link("https://aiaa.org/awards/regional-student-paper-conferences/")[aiaa.org/awards/regional-student-paper-conferences] (AIAA Region III Student Conference, West Lafayette, IN)])



