require "language/node"

class Fyrlang < Formula
	desc "Modern systems programming language that combines the versatility of C with the ease and safety of application programming languages like Java, Go or TypeScript"
	homepage "http://fyr.vs.uni-due.de"
	url "https://registry.npmjs.org/fyrlang/-/fyrlang-0.1.4.tgz"
	sha256 "6ba62ad3035a4b27176fd4d36081148c767f970deff9734bcc69032a28e38207"

	depends_on "node"
	# depends_on "llvm" # the llvm-gcc shim works fine

	def install
		system "npm", "install", "--prod", *Language::Node.std_npm_install_args(prefix)
		bin.install_symlink Dir["#{prefix}/lib/node_modules/fyrlang/bin/fyrc"]
	end
end