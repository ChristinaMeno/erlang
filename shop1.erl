-module(shop1).
-compile(export_all).

total([{What, N}|T]) -> shop:cost(What) * N + total(T);
total([]) -> 0.
