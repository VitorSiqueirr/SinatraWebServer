# S3-Sinatra_Web_Concepts

# Install

```
  gem install bundler
  bundle install 
```

# How to execute

```
  ruby server.rb
```

Sinatra server will listen to connections on http://localhost:4567

# Challenge week 3

The goal of this exercise is to create a HTML page showing some information about yourself on the sinatra server.

---

### Task 1 - Add an endpoint to render the page

- On the sinatra webserver, add an endpoint to render a HTML template.
- The endpoint should be available on the `/about` URL.
- It should render an `.erb` template file

### Task 2 - Create the HTML page

The HTML file must contains:

- A page title
- Some paragraphs describing yourself
- A list showing some of your skills
- Some hyperlinks to your social media accounts

### Task 3 - Use CSS

- Use CSS to style your page
- You can use the `<style>` tag on the page to write your css.

### References 

- https://www.tutorialspoint.com/html/index.htm
- https://html.com
- https://tutorialehtml.com/pt/html-guia-completo-tutorial-html/
- https://www.w3schools.com/howto/howto_css_about_page.asp