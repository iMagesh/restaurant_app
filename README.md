#Yuemey

* Ruby 2.2.2

##Seeds

###Industries
* Using list of industries from LinkedIn
* Run rake db:seed to populate industries table

##Front-End

###Modals
* Using [btford.modal](https://github.com/btford/angular-modal)
* `ModalBase` is a factory that should be injected in to every modal. It contains functions needed by all modals.

###Icons
**Implementation Notes**
To add a icon, just add the base `%i.icon`. To customize, youse the domain of choice, e.g.

```haml
%i.icon.facebook
```

This will render a black and white icon, to color it, add the `.colored` class

```haml
%i.icon.facebook.colored
```


[See this](https://github.com/johnkoht/yuemey/blob/icon-font/app/assets/stylesheets/core/_fonts.sass) for a list of all available social networks.
