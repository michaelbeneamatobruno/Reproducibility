library(tidyverse)
library(ggplot2)

huntingActivities = c(1:10, 1:10, 1:10, 1:10)
perCapitaBeluga = c(-9399, 266504, 358454, 404429, 432014, 450404, 463540, 473392, 481054, 487184)
perCapitaBeluga = perCapitaBeluga / 1000
belugaOpp = c(-454859, -179009, -87059, -41084, -13499, 4890, 18025, 27877, 35540, 41670)
belugaOpp = belugaOpp / 1000
beluga = c(perCapitaBeluga, belugaOpp)
perCapitaNarwhal = c(133278, 321500, 384240, 415611, 434433, 446981, 455944, 462666, 467895, 472077)
perCapitaNarwhal = perCapitaNarwhal / 1000
NarwhalOpp = c(-26735, 161486, 224227, 255597, 274419, 286967, 295930, 302653, 307881, 312064)
NarwhalOpp = NarwhalOpp / 1000
narwhal = c(perCapitaNarwhal, NarwhalOpp)
whales = c(beluga, narwhal)
class = c(rep("Non-Opportunity Beluga", 10), rep("Opportunity-Cost Beluga", 10), rep("Non-Opportunity Narwhal", 10), rep("Opportunity-Cost Narwhal", 10))
data = tibble(class, huntingActivities, whales)



beluga = ggplot(data = data, aes(x = huntingActivities, y = whales, shape = class)) + ggtitle("Economic Value per Hunt") + xlab("Number of Hunting Activites") + ylab("Average Use Value Per Capita($CAN")
beluga + geom_point() + scale_x_continuous(breaks = pretty(data$huntingActivities, n = 5)) + scale_y_continuous(breaks = pretty(data$whales, n = 10))