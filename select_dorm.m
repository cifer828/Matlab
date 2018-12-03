function p = select_dorm(void, cand)
p = nchoosek(cand-2, void-2)/ nchoosek(cand, void);
end