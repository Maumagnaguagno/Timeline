# Timeline
**Convert Markdown timeline to Graphviz DOT**

![Example timeline](https://rawgit.com/Maumagnaguagno/Timeline/master/README.md.dot.svg)

Timeline converts parts of Markdown to Graphviz DOT, which describes graphs.
Each ``[name]: http://www.website.com "tooltip"`` into a link, ``## name`` into a cluster, ``- [name]`` of a cluster into a node.
Links are expected to be defined before their respective nodes appear.
This README is actually a valid input, open the [raw](https://raw.githubusercontent.com/Maumagnaguagno/Timeline/master/README.md) file to see the links.
SVG output is recommended to take full advantage of links and tooltips, see the result [here](http://maumagnaguagno.github.io/Timeline).

```Shell
ruby timeline.rb README.md LR                   # Generate Left to Right DOT file
..\graphviz\bin\dot.exe README.md.dot -O -T svg # Generate SVG file
```

[IJCAI]: http://www.ijcai.org/ "International Joint Conference on Artificial Intelligence"
[UAI]: http://auai.org/uai2017/index.php "Conference on Uncertainty in Artificial Intelligence"
[IROS]: http://www.iros.org/ "International Conference on Intelligent Robots and Systems"
[ECAI]: http://www.ecai2016.org/ "European Conference on Artificial Intelligence"
[IAT]: http://wibih.unomaha.edu/wi "International Conference on Intelligent Agent Technology"
[SBGames]: http://sbgames.org/ "Simposio Brasileiro de Games e Entretenimento Digital"
[ICRA]: http://www.icra2017.org/ "International Conference on Robotics and Automation"
[SAC]: http://www.sigapp.org/sac/ "Symposium On Applied Computing"
[AAAI]: http://www.aaai.org/Conferences/conferences.php "Association for the Advancement of Artificial Intelligence"
[EUMAS]: https://eumas2017.ibisc.univ-evry.fr/ "European Conference on Multi-Agent Systems"
[ICAART]: http://www.icaart.org/ "International Conference on Agents and Artificial Intelligence"
[ICAPS]: http://www.icaps-conference.org/ "International Conference on Automated Planning and Scheduling"
[AAMAS]: http://www.ifaamas.org/ "International Conference on Autonomous Agents and Multiagent Systems"
[FLAIRS]: http://www.flairs.com/ "Florida Artificial Intelligence Research Society"
[KR]: http://www.kr.org/ "International Conference on Principles of Knowledge Representation and Reasoning"
[ICLP]: http://software.imdea.org/Conferences/ICLP2016/ "International Conference on Logic Programming"

## January
- [IJCAI] Abstracts

## February
- [IJCAI] Submission

## March
- [UAI] Submission
- [IROS] Submission

## April
- [IJCAI] Notification
- [ECAI] Submission
- [IAT] Submission
- [ICLP] Abstracts Submission

## May
- [KR] Abstracts Submission

## June
- [ECAI] Notification
- [IAT] Notification
- [UAI] Notification
- [IROS] Notification
- [ICLP] Notification

## July
- [SBGames] Abstracts Submission
- [KR] Notification

## August
- [SBGames] Notification

## September
- [ICRA] Submission
- [SAC] Abstracts Submission
- [AAAI] Abstracts Submission
- [EUMAS] Abstracts Submission

## October
- [EUMAS] Notification
- [ICAART] Submission

## November
- [AAAI] Notification
- [SAC] Notification
- [ICAPS] Abstracts Submission
- [AAMAS] Abstracts Submission
- [FLAIRS] Submission
- [ICAART] Notification

## December

## January
- [ICRA] Notification
- [ICAPS] Notification
- [AAMAS] Notification
- [FLAIRS] Notification