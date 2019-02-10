![fit](./react-logo-1000-transparent.png)

# [fit] Introduction **React.js**

## [fit] Webworkers Cologne, 27th January 2016, Christoph Jerolimov

---

## **Agenda**

1. Motivation & Concepts
2. Components & JSX
3. Virtuell DOM
4. Demo

---

![fit](./react-website.png)

^What's react.js, a lib, no framework
Easy to integrate, also on small parts
Pushished mid 2013 by Facebook
Mitte 2013 von Facebook veröffentlicht
First reactions were rather skeptical.
JSX is JS superset

---

![fit](./react-hype.jpg)

^Relevant?
Used by Facebook, Instagram, Whatsapp, Yahoo, AirBnB, Netflix, Github, ...
35000+ GitHub Stars, #7 Overall (#1 Bootstrap, #3 d3, #5 jquery)

---

## **Motivation**

<br/><br/>

Web**apps** are becoming increasingly complex

<br/><br/><br/>

**Goal**: **Simplify** UI-Code

^HTML is developed to define documents, not create apps
Simple to understand, easy to maintain, fix bugs without side-effects for example
rapid understanding of existing code
server-side-rendering

---

![fit](./davis-prismatic-example-01-before-cropped.png)

---

![fit](./davis-prismatic-example-02-after-cropped.png)

---

## **Quiz**

## [fit] How to update all relevant elements?

---

## **Idea**

## [fit] Just re-render the complete page!

---

## **Solution**

**Declerative UI**
(Unidirectional data flow)

**A view-only library**
(the view in MVC, but MVC is not required)

**Automatically updates the DOM**
(the browser is just *one possible* rendering engine)

^Components are capsulated, reuseable, testable units
Simple to understand and maintain

---

## **Components**

Every Element is/extends a `React.Compontent`

Internal private *state*<br/>vs<br/>External immutable *props*

Must implement at least the `render()`-method

Optional methods to handle the lifecycle/updates
(componentWillMount ... componentWillUnmount)

---

## **Simple JSX example**

JSX is a JS superset and supports sub-components (and DOM elements) inline:
<br/>

```javascript
class HelloWorld extends React.Component {
	render() {
		return <span>Hello World</span>;
	}
}
```

---

## **JSX usage**

```js
// Easy to render test data
const followButtonEnabled = <FollowButton enabled={ false } />
const followButtonDisabled = <FollowButton enabled={ true } />

// Use "any source" as props in production
const followButton = <FollowButton
		enabled={ currentUser.tags.contains(currentTag) }
		onClick={ () => { toggleTag(currentTag); } } />

```

---

## **JSX state example**

```js
class Blink extends React.Component {
	constructor(props) {
		super(props);
		this.state = { visible: true }
	}
	componentWillMount() {
		this.interval = setInterval(() => {
			this.setState({ visible: !this.state.visible });
		}, 1000);
	}
	componentWillUnmount() {
		this.clearInterval(this.interval);
	}
	render() {
		const style = { opacity: this.state.visible ? 1 : 0 };
		return <span style={ style }>{ this.props.children }</span>
	}
}
```

---

## **Virtual DOM / view hierarchy**

DOM manipulations are slow.

Render method generates a VDOM ("JSON")<br/>and calculates a diff to reduce DOM manipulations.
<br/>

*render ( UI-State<sub>n</sub> ) => VDOM<sub>n</sub>*
<br/>

*diff ( VDOM<sub>n-1</sub> , VDOM<sub>n</sub> ) => DOM updates...*

^The virtual DOM is a JS object, not bindet directly to the DOM.
This allow performance hacks etc.

---

## [fit] **Demo**

---

### **Questions?**

---

### **Thank you**
