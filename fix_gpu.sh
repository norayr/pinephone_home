cd /sys/class/devfreq/1c40000.gpu/
cat cur_freq min_freq max_freq governor
cd /sys/class/devfreq/1c40000.gpu/ && cat max_freq > min_freq
cat cur_freq min_freq max_freq governor
cat available_governors
#echo performance > governor
cat max_freq > min_freq

