
public class SHA
{

    private static final int[] K = new int[]{
            0xC67178F2,0xBEF9A3F7,0xA4506CEB,0x90BEFFFA,
            0x8CC70208,0x84C87814,0x78A5636F,0x748F82EE,
            0x682E6FF3,0x5B9CCA4F,0x4ED8AA4A,0x391C0CB3,
            0x34B0BCB5,0x2748774C,0x1E376C08,0x19A4C116,
            0x106AA070,0xF40E3585,0xD6990624,0xD192E819,
            0xC76C51A3,0xC24B8B70,0xA81A664B,0xA2BFE8A1,
            0x92722C85,0x81C2C92E,0x766A0ABB,0x650A7354,
            0x53380D13,0x4D2C6DFC,0x2E1B2138,0x27B70A85,
            0x14292967,0x06CA6351,0xD5A79147,0xC6E00BF3,
            0xBF597FC7,0xB00327C8,0xA831C66D,0x983E5152,
            0x76F988DA,0x5CB0A9DC,0x4A7484AA,0x2DE92C6F,
            0x240CA1CC,0x0FC19DC6,0xEFBE4786,0xE49B69C1,
            0xC19BF174,0x9BDC06A7,0x80DEB1FE,0x72BE5D74,
            0x550C7DC3,0x243185BE,0x12835B01,0xD807AA98,
            0xAB1C5ED5,0x923F82A4,0x59F111F1,0x3956C25B,
            0xE9B5DBA5,0xB5C0FBCF,0x71374491,0x428A2F98};

    private static final long MAX = 0xffffffffL;

    private long[] H;
    public SHA(){
        H = new long[8];
        resetHash();
    }
    public void resetHash(){
        H[0] = (0x5be0cd19L);
        H[1] = (0x1f83d9abL);
        H[2] = (0x9b05688cL);
        H[3] = (0x510e527fL);
        H[4] = (0xa54ff53aL);
        H[5] = (0x3c6ef372L);
        H[6] = (0xbb67ae85L);
        H[7] = (0x6a09e667L);
    }

    public long[] readHash(){
        return H;
    }
    public void hash(int input){
        long[] block = setup(input);

        long[] W = new long[64];
        for(int i = 0; i < 16; i++){
            W[i] = block[15-i];
        }

        for(int i = 16; i < 64; i++){
            W[i] = (W[i-7] + W[i-16] + sig1(W[i-15]) + sig0(W[i-2]))&MAX;

        }
        long a,b,c,d,e,f,g,h;
        long a_new,b_new,c_new,d_new,e_new,f_new,g_new,h_new;
        a = H[0]&MAX;
        b = H[1]&MAX;
        c = H[2]&MAX;
        d = H[3]&MAX;
        e = H[4]&MAX;
        f = H[5]&MAX;
        g = H[6]&MAX;
        h = H[7]&MAX;
        for(int i = 0; i < 64; i++){
            long t1 = (h + bigsig1(e) + Ch(e,f,g) + K[i] + W[i])&MAX;
            long t2 = (bigsig0(a) + Maj(a,b,c))&MAX;
            //
            //printHash(newHash);
            //printVars(a,b,c,d,e,f,g,h);

            //

            h_new = (g)&MAX;
            g_new = (f)&MAX;
            f_new = (e)&MAX;
            e_new = (d + t1)&MAX;
            d_new = (c)&MAX;
            c_new = (b)&MAX;
            b_new = (a)&MAX;
            a_new = (t1+t2)&MAX;

            a = a_new;
            b = b_new;
            c = c_new;
            d = d_new;
            e = e_new;
            f = f_new;
            g = g_new;
            h = h_new;

        }

        H[0] = (H[0] + a)&MAX;
        H[1] = (H[1] + b)&MAX;
        H[2] = (H[2] + c)&MAX;
        H[3] = (H[3] + d)&MAX;
        H[4] = (H[4] + e)&MAX;
        H[5] = (H[5] + f)&MAX;
        H[6] = (H[6] + g)&MAX;
        H[7] = (H[7] + h)&MAX;
    }

    private long[] setup(int input){
        long[] block = new long[16];
        block[15] = input;
        block[14] = 0x80000000L;
        for(int i = 13; i > 0; i--){
            block[i] = 0;
        }
        block[0] = 32;
        return block;
    }

    private long sig0(long x){
        return Rotr(x,7)^ Rotr(x,18)^(x >>> 3);
    }

    private long sig1(long x){
        return Rotr(x,17)^ Rotr(x,19)^(x >>> 10);
    }

    private long bigsig0(long x){
        return Rotr(x,2)^ Rotr(x,13)^ Rotr(x,22);
    }

    private long bigsig1(long x){
        return Rotr(x,6)^ Rotr(x,11)^ Rotr(x,25);
    }

    private long Maj(long x, long y, long z){
        return (x&y)^(x&z)^(z&y);
    }

    private long Ch(long x, long y, long z){
        return (x&y)^(~x&z);
    }
    private long Rotr(long x, int shift){
        long pow = (long)Math.pow(2,shift);
        pow -= 1;
        long lowerBits = x & pow;
        lowerBits = lowerBits << (32-shift);
        x = (x >>> shift) | lowerBits;

        return x;
    }

    public void printHash(long[] hash){
        for(int i = hash.length-1; i >= 0; i--){
            System.out.print(String.format("%08X",hash[i]));
        }

        System.out.println();
    }

    public static void main(String[] args){
        SHA sha = new SHA();
        sha.hash(65);
        long[] h = sha.readHash();
        sha.printHash(h);

    }
}
