---
id: 10967
title: Classes, instances, differentiation
date: 2015-04-07T08:17:23+00:00
author: Protesilaos Stavrou
excerpt: On the logical order of classes and elements as well as the differentiation of instances.
guid: https://protesilaos.com/?p=10967
permalink: /classes-instances-differentiation/
categories:
  - Philosophy
tags:
  - Discernibility
  - Logic
  - Metaphysics
  - Realisability
---
Some `A` is a class. A given element `a` of `A` qua element inherits and extends the properties germane to `A`. Elements are instances of the class. The class as such does not manifest in its entirety within its element(s). If a class has a single element, then the distinction between the actuality of the two is either superfluous or specific to the particularities of a certain application.

There are class properties and element properties. The former are of a higher order than the latter. Their relation is hierarchical, so that all class properties are discernible in the elements, though not vice versa (e.g. all birds are animals, not all animals are birds). If we are to use curly brackets `{}` to denote the [array of] properties, each of which would correspond to a variable, we get:

<pre>A {x,y,z}
a {p,q,r}</pre>

Visualised hierarchically, this would be:

<pre>A {x,y,z}
— a {p,q,r}</pre>

Because of [inheritance](https://protesilaos.com/set-inheritance/), `a {p,q,r}` actually represents  `a[A] {p,q,r}`, where `A` is `A {x,y,z}`. The hierarchy can be inferred by examining multiple elements. If the objects `a`, `b` and `c` and the properties thereof were to be examined in isolation, a pattern would emerge.

<pre>a {x,y,z,p,q,r}
b {x,y,z,f,j,k}
c {x,y,z,m,n,o}

// which is

a[A] {p,q,r}
b[A] {f,j,k}
c[A] {m,n,o}

// which implies

A {x,y,z}
— a {p,q,r}
— b {f,j,k}
— c {m,n,o}</pre>

Though each element differs from the others, all stand as equal in terms of partaking of `A`. The elements are heterarchical with respect to extending the class. Strictly speaking, if the properties of the class are not found in its elements, its definition is either false or inadequate, for it fails to reflect the [common in the multitude](https://protesilaos.com/common-multitude/) among the elements&#8217; properties.

If [some definition](https://protesilaos.com/definitions/) of `A` were to formulate its full array of properties as `{x,y,z,p,q,r,f,j,k,m,n,o}` it would be fallacious, as only a part of those properties is found in all the elements — the rest, those peculiar to each element are factors of discernment. For the elements to be differentiable, there must exist some quality that renders each distinct from others. In this case, it would be found in their respective properties.

Differentiation can also be realised in the mode of being, such as a `switch` having `on` and `off` states. An object can have multiple modal states, such as a `human` being `asleep`, `walking`, `eating` etc. To denote a certain mode of being in our above formalisation, we may use integers as subscripts.

<pre>A<sub>1</sub>, A<sub>2</sub>, A<sub>3
</sub></pre>

What modality entails is the potential formal distinction between the various states a given object may have. &#8220;The same&#8221; thing stands as different to itself, whereas differences in properties are between distinct objects. The one is intra-objective, the other inter-objective. To recapitulate on what was propounded herein, we have argued for the following:

  * classes have elements
  * elements are instances of the class, not the class as such
  * there are class properties and element properties
  * the relation between them is hierarchical, so that the properties of the class are of a higher order than those of the elements
  * the properties of the class are all inherited by its elements, though not the other way round
  * elements are heterarchical with regard to their function of extending their class
  * a proper definition of the class must encapsulate the common in the multitude among its elements
  * the qualities peculiar to each element operate as factors of discernment between the elements
  * differentiation can be realised in the properties or the modal state of an object; the former would be interobjective, the latter can be intraobjective

Thank you for reading!

_No significance is attached to the actual notation. These formalisations can be written otherwise. What matters is the argument and the conceptual relations._