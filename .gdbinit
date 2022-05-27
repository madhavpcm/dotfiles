source ~/gdb_ghidra_bridge_client.py
set disassembly-flavor intel

define plist 
  set var $n = $arg0
  while $n
    print *($n)
    set var $n = $n->next
  end
end

document plist 
        plist LIST_HEAD_POINTER
        Print all the fields of the nodes in the linked list pointed to by LIST_HEAD_POINTER. Assumes there is a next field in the struct.
end

define indentby
    printf "\n"
    set $i_$arg0 = $arg0
    while $i_$arg0 > 10
        set $i_$arg0 = $i_$arg0 - 1
        printf "%c", ' '
    end
end
define bntree 
        set $node_$arg0 = ($arg1)
        set $leftid_$arg0 = $arg0 + 1
        set $rightid_$arg0 = $arg0 + 2
        set $space_$arg0 = ($arg2) + 10
        
        if $node_$arg0->right
                draw_sideways_btree $rightid_$arg0 $node_$arg0->right $space_$arg0
        end
        
        indentby $space_$arg0

        printf "%d\n", $node_$arg0->item

        if $node_$arg0->left
                draw_sideways_btree $leftid_$arg0 $node_$arg0->left $space_$arg0
        end    
end

define start_draw_sideways_btree
        bntree 0 $arg0 0
end

document start_draw_sideways_btree
        start_draw_sideways_btree ROOT_POINTER_NAME
        Draw a sideways representation of the binary tree pointed to by ROOT_POINTER_NAME 
end
