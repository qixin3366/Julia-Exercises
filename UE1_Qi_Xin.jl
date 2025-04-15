
#=
Fuege in dieses Template deine Loesungscodes ein.
Wichtig 1: Die Datei gemaess der Namensrichtlinien benennen.
Wichtig 2: Bitte nur die Funktionen ausprogrammieren und keine Funktionsaufrufe vornehmen.
=#


### Beispiel 1:

function greatest(x::Vector{T}, k::Integer = 1) :: Vector{T} where {T <: Real}
    # Parameter pruefen
    if k <= 0 || k > length(x)
        error("ERROR: DomainError with k must be between 1 und length(x).")
    end

    # Standardverhalten und allgemeiner Fall
    sorted_x = sort(x, rev = true)
    top_k_elements = sorted_x[1:k]

    # Reihenfolge im urspruenglichen Vektor behalten
    return [xi for xi in x if xi in top_k_elements]
end


### Beispiel 2

function nearestindex(x::Vector{<:Real}, y::Real) :: Int
    differences = abs.(x .- y)
    min_diff = minimum(differences)
    closest_indices = findall(==(min_diff), differences)

    # Zufaelligen Index waehlen, falls mehrere aehnliche Elemente vorhanden
    return rand(closest_indices)
end


### Beispiel 3

function swap!(x::Vector, i::Integer, j::Integer) :: Nothing
    tmp = x[i]
    x[i] = x[j]
    x[j] = tmp
    return nothing
end

function bubblesort!(x::Vector{<:Real}; rev::Bool = false) :: Nothing
   n = length(x)
    for i in 1:n-1
        for j in 1:n-i
            if (!rev && x[j] > x[j+1]) || (rev && x[j] < x[j+1])
                swap!(x, j, j+1)
            end
        end
    end
    return nothing
end


### Beispiel 4

function canonicaltour(x::Vector{T}) :: Vector{T} where {T <: Integer}
    # Permutation der Zahlen von 1 bis n pruefen.
    if sort(x) != collect(1:length(x))
       error("ArgumentError: x must be a permutation of of the numbers 1:length(x).")
    end

    # Startstadt auf 1 festlegen
    pos = findfirst(==(1), x)
    reordered = circshift(x, -pos+1)

    # evtl. Richtung umkehren
    if reordered[2] > reordered[end]
       reordered[2:end] = reverse(reordered[2:end])
    end
    return reordered
end


### Beispiel 5

function distance(x::Vector{<:Real}, y::Vector{<:Real}; p::Real = 2)
    # Laenge pruefen
    if length(x) != length(y)
        error("ArgumentError: x and y should have the same length.")
    end
    
    # p must be positive
    if p <= 0
       error("ArgumentError: p > 0 must hold!")
    end

    # Berechnung der Distanz
    return (sum(abs.(x .- y) .^ p))^(1/p)
end

