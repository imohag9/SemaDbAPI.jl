using SemaDbAPI
using Documenter

DocMeta.setdocmeta!(SemaDbAPI, :DocTestSetup, :(using SemaDbAPI); recursive=true)

makedocs(;
    modules=[SemaDbAPI],
    authors="imohag9 <souidi.hamza90@gmail.com> and contributors",
    sitename="SemaDbAPI.jl",
    format=Documenter.HTML(;
        canonical="https://imohag9.github.io/SemaDbAPI.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Collections" => "collections.md",
        "Points" => "points.md",
        "Search" => "search.md",
        "Models" => "api_reference.md",
        "Search" => "search.md",
        ],
)

deploydocs(;
    repo="github.com/imohag9/SemaDbAPI.jl",
    devbranch="main",
)
