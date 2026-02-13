library(dplyr)
library(ggplot2)

the_vowels <- read.csv("./users/data.csv") 
#%>%
  #mutate(speaker = tolower(speaker))

head(the_vowels)
str(the_vowels)
dim(the_vowels)
typeof(the_vowels)

ggplot()
ggplot(the_vowels, aes(x = F2, y = F1))

ggplot(the_vowels, aes(x = F2, y = F1)) + 
  geom_point()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel)) + 
  geom_point() + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel)) + 
  geom_point() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  theme_classic()

the_vowels <- the_vowels %>%
  mutate(vowel = factor(vowel,
                        levels = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")))

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel)) + 
  geom_point() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel)) + 
  geom_point() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) + 
  theme_classic()

means <- the_vowels %>%
  summarise(mean_F1 = mean(F1),
            mean_F2 = mean(F2)) %>%
  print()

means <- the_vowels %>%
  group_by(vowel) %>%
  summarise(mean_F1 = mean(F1),
            mean_F2 = mean(F2))

# Here's a shortcut using more modern code
means <- the_vowels %>%
  summarise(mean_F1 = mean(F1),
            mean_F2 = mean(F2),
            .by = vowel)

print(means)


ggplot(means, aes(x = mean_F2, y = mean_F1)) + 
  geom_point() + 
  theme_classic()


ggplot(means, aes(x = mean_F2, y = mean_F1, label = vowel)) + 
  geom_label() + 
  theme_classic()

ggplot(means, aes(x = mean_F2, y = mean_F1, label = vowel)) + 
  geom_label() + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) +
  geom_point() +
  geom_label(data = means, aes(x = mean_F2, y = mean_F1)) +
  scale_x_reverse() + scale_y_reverse() +
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU"))  +
  theme_classic()


ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point() + 
  geom_label(data = means, aes(x = mean_F2, y = mean_F1)) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point() + 
  geom_label(data = means, aes(x = mean_F2, y = mean_F1), color = "black") + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

means <- the_vowels %>%
  group_by(vowel) %>%
  summarise(F1 = mean(F1),
            F2 = mean(F2))
ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point() + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) + 
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) +
  geom_point() +
  geom_label(data = means, color = "black") +
  stat_ellipse() +
  scale_x_reverse() + scale_y_reverse() +
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) +
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point() + 
  geom_label(data = means, color = "black") + 
  stat_ellipse(level = 0.67) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point() + 
  stat_ellipse(level = 0.67) + 
  geom_label(data = means, color = "black") + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  #geom_point() + 
  stat_ellipse(level = 0.67) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point(alpha = 0.2) + 
  stat_ellipse(level = 0.67) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  geom_point(size = 0.75) + 
  stat_ellipse(level = 0.67) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  stat_ellipse(level = 0.67, geom = "polygon") + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  stat_ellipse(level = 0.67, geom = "polygon", alpha = 0.1) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel, fill = vowel)) + 
  stat_ellipse(level = 0.67, geom = "polygon", alpha = 0.1) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

ggplot(the_vowels, aes(x = F2, y = F1, color = vowel, label = vowel)) + 
  stat_ellipse(level = 0.67, geom = "polygon", alpha = 0.1, aes(fill = vowel)) + 
  geom_label(data = means) + 
  scale_x_reverse() + 
  scale_y_reverse() + 
  scale_color_discrete(breaks = c("a", "e", "i", "o", "u", "a:", "e:", "i:", "o:", "u:", "aI", "aU")) +
  guides(color = FALSE) + 
  theme_classic()

