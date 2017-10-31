## r4ds

# visualization

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, color=class=="2seater"))


ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, size=class))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, alpha=class))

ggplot(data=mpg) + geom_point(mapping=aes(x=displ, y=hwy, shape=class))

# Facets
ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy), color="blue") +
  facet_wrap(~class)

ggplot(data=mpg) +
  geom_point(mapping=aes(x=displ, y=hwy))


ggplot(data=mpg) +
  geom_smooth(mapping=aes(x=displ, y=hwy, linetype=drv)) +
  geom_point(mapping=aes(x=displ, y=hwy, color=drv))


ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point(mapping=aes(color=drv)) +
  geom_smooth()



## Ejercicio: Recrear los gráficos
ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy)) + 
  geom_smooth(mapping=aes(x=displ, y=hwy), se=FALSE)

## Ejercicio: Recrear los gráficos
ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy)) + 
  geom_smooth(mapping=aes(x=displ, y=hwy, group=drv), se=FALSE)

ggplot(data=mpg, mapping=aes(color=drv)) + 
  geom_point(mapping=aes(x=displ, y=hwy)) + 
  geom_smooth(mapping=aes(x=displ, y=hwy, group=drv), se=FALSE)

ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=drv)) + 
  geom_smooth(mapping=aes(x=displ, y=hwy), se=FALSE)


ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=drv)) + 
  geom_smooth(mapping=aes(x=displ, y=hwy, linetype=drv), se=FALSE)


ggplot(data=mpg) + 
  geom_point(mapping=aes(x=displ, y=hwy, color=drv))


ggplot(data=diamonds) + 
  geom_bar(mapping=aes(x=cut))



ggplot(data=diamonds) + 
  stat_count(mapping=aes(x=cut))


# Bar charts calculate new values to plot

# You can learn which stat a geom uses by inspecting 
# the default value for the stat argument. 
# For example, ?geom_bar shows that the default value for stat is “count”, 
# which means that geom_bar() uses stat_count(). 
# stat_count() is documented on the same page as geom_bar(), 
# and if you scroll down you can find a section called “Computed variables”. 
# That describes how it computes two new variables: count and prop.

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data=demo) + 
  geom_bar(mapping=aes(x=cut, y=freq), stat="identity")


ggplot(data=diamonds) + 
    geom_bar(mapping=aes(x=cut, y=freq), stat="min")

ggplot(data=diamonds) +
  stat_summary(
    mapping = aes(x=cut, y = depth),
    fun.ymin = max,
    fun.ymax = min,
    fun.y = max)


ggplot(data=diamonds) +
  stat_pointrange