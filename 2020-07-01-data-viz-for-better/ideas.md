# Inspiration:

## Viz for better


My Florence mug (statistician & nurse)
Communicator (key part of both)

Why do we make plots...
Pretty
Get published
Clickbate
Art
Make a difference / make a change

## How can graphics make a difference?
* ACTION
* Challenger disaster
https://bookdown.org/egarpor/PM-UC3M/glm-challenger.html
* evidence-based healthcare

FN: Asking the right questions - What make a good graph(before the plot)
FN: Organise correctly - to make comparisons

## Victoria viz

Playfair
Minard

Golden Age of Statistics: https://projecteuclid.org/download/pdfview_1/euclid.ss/1242049392
Graphcs: https://archive.org/details/mortalityofbriti00lond/page/n33/mode/2up

" printed Tables & all in double columns I do not think anyone will read it. None but scientific men ever look in the Appendix of a Report. And this is for the vulgar public."
Tables more common, graphics not seen as usfeul (cite)

Nightingale hoped her charts would liven up her publications; the queen, she thought, might look at the pictures, even if she did not read the words.

## Florence's diagrammes

### The wedge

#### Introduction

* Name (rose, polar area, wedges)
* Coxcombe - not the name - pampleft - she self-publisised go girl!
* Describe it visually
* Worked with Dr William Farr(Medical Statistician)
* Covid-collateral damage 
* Originally Batwing but FN was worried misinterpretted.
 * "The length of the radial line in each month is proportional to the death rate, but both the text and the appearance imply that it is the shaded area that is proportional to the death rate, rather than the length of the radial lines.  Florence recognised this error and inserted an erratum slip, but then replaced this diagram in later documents (nos. 3, 4, and 5 listed above) with what I will call the 'wedges' diagram."
 
 * She didn't invent it:
  * The first known use of polar area diagrams was by André-Michel Guerry,
    * In 1829, Guerry invented a new graphic form, the polar area diagram to show variations in weather and       other phenomena over calendar cycles.[Explore!](https://history.infowetrust.com/)


#### Reviewing / exploring the diagram

* Show a modern version for easier reading
* Why didn’t she make a column chart?
 * Compare year on year
 * Compare season on season
 * Stand out from the rest (many bar charts)
 * Which tells the better story?
* colour palette
* cyclic pattern - circular

* Bar chart - polar area [distortion ](https://understandinguncertainty.org/node/214)

* Not a bar chart!
 3 benefits of Nightingale Rose charts over pie charts
 1) Each slice takes an equal sector of the circle, making labeling much cleaner
 2) Each slice still maintains an accurate area comparison w/ other slices (by making the radius of the slice equal to the square root of the value);
 3) Since each slice is in a fixed position and the charts can be made much smaller than pie charts, small multiples are very easy to create
 
* Could we improve
 * Read left-to-right?
 * Catchy title
 
#### Opinions
* The diagrams improve on pie charts in exchange for a greater difficulty of reading. As is the case for pie charts, the inherent problem is the difficulty of making good comparisons across the wedges. In general, for such small data sets, tables will outperform graphics.

-- Edward Tufte

* Is it wrong to be enraged by a graph - LL
* The graph conceals parts of the data, misrepresents quantity by area, and what is worst of all, *requires explanation*.

### Her other plots

### Area / stacked

Most of the graphics used in Nos. 1 and 2 are similar to those previously used by her adviser William Farr in his Registrar-General's Annual Reports.  They are mostly what we might call '100% area' or '100% stacked bar':  Lord Herbert bar chart

#### Honeycomb
There is also one 'honeycomb' graphic showing how densely soldiers are packed in camp (a device which Farr had already used for illustrating urban density), and two other graphics that are highly original.  

#### Lines
The other highly original chart is what I will call the 'Lines' - a bar chart showing how soldiers in peacetime, living in their barracks in England, were dying at a faster rate than civilians in the cities around them.

## Re-creating in R

### StatsYSS #FloViz competition

* All the results: 
https://twitter.com/statsyss/status/1260168592198455301

https://statsyss.wordpress.com/2020/05/13/floviz-winning-entries/

Highlight my favourites
Edward Gunning: https://github.com/edwardgunning/FlorenceNightingale

Graham:
https://t.co/PxDiVppHI4?amp=1

### Elsewhere
https://www.theguardian.com/world/interactive/2012/may/08/gay-rights-united-states
http://measure.fathom.info/

### My attempt

#### Perfect recreation in R (Flipbook)
* https://rpubs.com/kwlee58/492913 
* [data](https://www.rdocumentation.org/packages/HistData/versions/0.8-6/topics/Nightingale): 
* Use flip book to show the breakdown
* Use shiny to make interactive? Or plotly?
* Appearing in time 
* show minimise from Before and after

#### Showcasing modern data in this style (Covid?)

#### Plots of R-Ladies data in Florence diagrams

## Modern Nightingales
Who are the modern Florence Nightingales?

[TO READ](https://medium.com/@bituin/9-inspiring-females-in-data-visualization-6bf332185556)
[TO READ](https://medium.com/nightingale/beyond-nightingale-being-a-woman-in-data-visualization-d7968d171ccf)

Many *twitter links and images*

* [Amy Cesal](https://medium.com/nightingale/https-medium-com-data-visualization-society-wedding-data-viz-36e7b9f4787f)

* Mona Chalabi

## Last words

* Improve ourselves - through observation and reason
* "God's revenge upon murder" (Divine mission - unavoidable deaths)
* RSS moto  Data | Evidence | Decisions
* Economist: 

 “We do not want impressions, we want facts,” Farr wrote to her in 1861. “You complain that your report would be dry. The dryer the better. Statistics should be the dryest of all reading.” Fortunately, she ignored him.

--- 

# References & Further Reading

[Video](https://www.youtube.com/watch?list=PLnveZHaGXU2kmJsJ7CwSgoQlLXVMzsZVe&v=u6XqiDccroM)
http://www.florence-nightingale-avenging-angel.co.uk/GraphicsPaper/Graphics.htm
https://understandinguncertainty.org/coxcombs
https://medium.com/nightingale/florence-nightingale-is-a-design-hero-8bf6e5f2147
http://www.indiemaps.com/blog/2008/10/nightingales-roses-in-actionscript-3/
Significance magazine Lyn McDonald, Alison Hedley
[Economist article](https://www.economist.com/christmas-specials/2013/10/07/worth-a-thousand-words)

[ Cleveland's "Elements of Graphing Data.]( 3 benefits of Nightingale Rose charts over pie charts)

## Image credits:
Wedge: Diagram of the mortality in the British Army in the east during April 1854 to March 1855 (right) and April 1855 to March 1856 (left) in comparison to that of Manchester, represented by the circular dotted line. Credit: [Wellcome Collection](https://wellcomecollection.org/works/p4mbdctw).

Wedge 2: Credit: Diagram of the causes of mortality in the army. Credit: [Wellcome Collection](https://wellcomecollection.org/works/sz9sms2m). Attribution 4.0 International (CC BY 4.0)

Wedge 3 Credit: Diagram showing mortality in hospitals at Scutari & Kulali. Credit: [Wellcome Collection.](https://wellcomecollection.org/works/nusfjvfg) Attribution 4.0 International (CC BY 4.0)
